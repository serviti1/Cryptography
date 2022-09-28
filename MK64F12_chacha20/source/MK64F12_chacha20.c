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
 * @file    MK64F12_chacha20.c
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
#include "mbedtls/chacha20.h"

#include MBEDTLS_CONFIG_FILE

#define mbedtls_exit(x) \
    do                  \
    {                   \
    } while (1)

#define KEYSIZE 32
#define BUFFERSIZE 32
#define NONCESIZE 12

const unsigned char keyChaCha[KEYSIZE] = {
	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
	0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
	0x21, 0x22
};

const unsigned char nonceChaCha[NONCESIZE] = {
	0xAA, 0xBB, 0xCC, 0x1F, 0xF3, 0xC4,
	0xBA, 0xCF, 0x4A, 0x6F, 0x9E, 0x7D
};

unsigned char plaintext[BUFFERSIZE] = {
	0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
	0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
	0x31, 0x32
};

unsigned char ciphertext[BUFFERSIZE];

int main(void) {
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
    }

    PRINTF("Running ChaCha20 algorithm\n\r");

    mbedtls_chacha20_crypt( keyChaCha, nonceChaCha, 0U, BUFFERSIZE, plaintext, ciphertext);

    PRINTF("plaintext : ");
    for(int i = 0; i<BUFFERSIZE; i++){
    	PRINTF("%x", plaintext[i]);
    }
    PRINTF("\n\rciphertext: ");
    for(int i = 0; i<BUFFERSIZE; i++){
		PRINTF("%x", ciphertext[i]);
	}
    PRINTF("\n\r");
    while(1) {
    }
    return 0 ;
}
