/*
 * Copyright 2016-2022 NXP
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of NXP Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file    MK64F12_FinalProject.c
 * @brief   Application entry point.
 */
#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "MK64F12.h"
#include "fsl_debug_console.h"

#include "mbedtls/version.h"
#include "ksdk_mbedtls.h"
#include "mbedtls/aes.h"
#include "mbedtls/rsa.h"
#include "mbedtls/sha256.h"

#include MBEDTLS_CONFIG_FILE

#define mbedtls_exit(x) \
    do                  \
    {                   \
    } while (1)

#define SHA256 0

#define KEYSIZE 32
#define BUFFERSIZE 32
#define IVSIZE 16
#define RSAKEYSIZE 1024
#define RSASIGNSIZE 128

const unsigned char aesKey[KEYSIZE] = {
	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
	0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
	0x21, 0x22
};

unsigned char initVector[IVSIZE] = {
	0xF0, 0xD5, 0xC2, 0xB7, 0x22, 0x09, 0xA0, 0x9F,
	0x10, 0x21, 0x42, 0x33, 0xA5, 0xFF, 0xB6, 0xC8
};

unsigned char plaintext[BUFFERSIZE] = {
	0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
	0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
	0x31, 0x32
};

unsigned char ciphertext[BUFFERSIZE];

unsigned char Hashtext[BUFFERSIZE];

unsigned char rsaSignature[RSASIGNSIZE];

int publicExponent = 0x10001;

/* Random Fuction to be passed to RSA key generation */
static int myrand( void *rng_state, unsigned char *output, size_t len );

/*
 * @brief   Application entry point.
 */
int main(void) {
	mbedtls_aes_context aes;
	mbedtls_sha256_context sha256;
	mbedtls_rsa_context rsa;

    /* Init board hardware. */
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitBootPeripherals();
#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
    /* Init FSL debug console. */
    BOARD_InitDebugConsole();
#endif

    /* Init Crypto HW */
	if( CRYPTO_InitHardware() != kStatus_Success ) {
		PRINTF("Initialization of crypto HW failed\n");
		mbedtls_exit(MBEDTLS_PLATFORM_STD_EXIT_FAILURE);
	} else {
		PRINTF("crypto HW initialized successfully");
	}

	PRINTF("\n\rplaintext : ");
	for(int i = 0; i<BUFFERSIZE; i++){
		PRINTF("%x", plaintext[i]);
	}

	/* Init AES module */
	mbedtls_aes_init(&aes);
	/* Set AES key */
	mbedtls_aes_setkey_enc( &aes, aesKey, KEYSIZE);
	/* Generate AES-CBC encryption */
	mbedtls_aes_crypt_cbc( &aes, MBEDTLS_AES_ENCRYPT, BUFFERSIZE, initVector, plaintext, ciphertext);
	/* Free AES context generated */
	mbedtls_aes_free(&aes);

	PRINTF("\n\rciphertext: ");
	for(int i = 0; i<BUFFERSIZE; i++){
		PRINTF("%x", ciphertext[i]);
	}

	/* Init SHA256 module */
	mbedtls_sha256_init(&sha256);
	/* Generate Hash over the ciphertext */
	mbedtls_sha256(ciphertext, BUFFERSIZE, Hashtext, SHA256);
	/* Free SHA256 context generated */
	mbedtls_sha256_free(&sha256);

	PRINTF("\n\rhashtext: ");
	for(int i = 0; i<BUFFERSIZE; i++){
		PRINTF("%x", Hashtext[i]);
	}

	/* Init RSA-PKCSV15 module */
	mbedtls_rsa_init(&rsa, MBEDTLS_RSA_PKCS_V15, 0);
	/* Generate Key pair (Public and Private keys) */
	mbedtls_rsa_gen_key(&rsa, myrand, NULL, RSAKEYSIZE, 0x10001);
	/* Sign Hash text with RSAPKCSV15 */
	mbedtls_rsa_rsassa_pkcs1_v15_sign(&rsa, myrand, NULL, MBEDTLS_RSA_PRIVATE, MBEDTLS_MD_NONE, BUFFERSIZE, Hashtext, rsaSignature);
	/* Free RSAPKCSV15 context generated */
	mbedtls_rsa_free(&rsa);

	PRINTF("\n\rRSA Signature: ");
	for(int i = 0; i<RSASIGNSIZE; i++){
		PRINTF("%x", rsaSignature[i]);
	}

    while(1) {
    }
    return 0 ;
}

static int myrand( void *rng_state, unsigned char *output, size_t len )
{
    size_t use_len;
    int rnd;

    if( rng_state != NULL )
        rng_state  = NULL;

    while( len > 0 )
    {
        use_len = len;
        if( use_len > sizeof(int) )
            use_len = sizeof(int);

        rnd = rand();
        memcpy( output, &rnd, use_len );
        output += use_len;
        len -= use_len;
    }

    return( 0 );
}
