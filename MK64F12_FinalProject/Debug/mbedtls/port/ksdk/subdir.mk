################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mbedtls/port/ksdk/aes_alt.c \
../mbedtls/port/ksdk/des_alt.c \
../mbedtls/port/ksdk/ecp_alt.c \
../mbedtls/port/ksdk/ecp_alt_ksdk.c \
../mbedtls/port/ksdk/ecp_curves_alt.c \
../mbedtls/port/ksdk/ksdk_mbedtls.c 

C_DEPS += \
./mbedtls/port/ksdk/aes_alt.d \
./mbedtls/port/ksdk/des_alt.d \
./mbedtls/port/ksdk/ecp_alt.d \
./mbedtls/port/ksdk/ecp_alt_ksdk.d \
./mbedtls/port/ksdk/ecp_curves_alt.d \
./mbedtls/port/ksdk/ksdk_mbedtls.d 

OBJS += \
./mbedtls/port/ksdk/aes_alt.o \
./mbedtls/port/ksdk/des_alt.o \
./mbedtls/port/ksdk/ecp_alt.o \
./mbedtls/port/ksdk/ecp_alt_ksdk.o \
./mbedtls/port/ksdk/ecp_curves_alt.o \
./mbedtls/port/ksdk/ksdk_mbedtls.o 


# Each subdirectory must supply rules for building sources it contributes
mbedtls/port/ksdk/%.o: ../mbedtls/port/ksdk/%.c mbedtls/port/ksdk/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -DMBEDTLS_CONFIG_FILE='"ksdk_mbedtls_config.h"' -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\board" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\source" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\drivers" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\device" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\CMSIS" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\utilities" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\component\serial_manager" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\component\uart" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mmcau" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mbedtls\include" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mbedtls\library" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mbedtls\port\ksdk" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\component\lists" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-mbedtls-2f-port-2f-ksdk

clean-mbedtls-2f-port-2f-ksdk:
	-$(RM) ./mbedtls/port/ksdk/aes_alt.d ./mbedtls/port/ksdk/aes_alt.o ./mbedtls/port/ksdk/des_alt.d ./mbedtls/port/ksdk/des_alt.o ./mbedtls/port/ksdk/ecp_alt.d ./mbedtls/port/ksdk/ecp_alt.o ./mbedtls/port/ksdk/ecp_alt_ksdk.d ./mbedtls/port/ksdk/ecp_alt_ksdk.o ./mbedtls/port/ksdk/ecp_curves_alt.d ./mbedtls/port/ksdk/ecp_curves_alt.o ./mbedtls/port/ksdk/ksdk_mbedtls.d ./mbedtls/port/ksdk/ksdk_mbedtls.o

.PHONY: clean-mbedtls-2f-port-2f-ksdk

