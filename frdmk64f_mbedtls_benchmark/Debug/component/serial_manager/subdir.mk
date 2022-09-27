################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/serial_manager/fsl_component_serial_manager.c \
../component/serial_manager/fsl_component_serial_port_uart.c 

C_DEPS += \
./component/serial_manager/fsl_component_serial_manager.d \
./component/serial_manager/fsl_component_serial_port_uart.d 

OBJS += \
./component/serial_manager/fsl_component_serial_manager.o \
./component/serial_manager/fsl_component_serial_port_uart.o 


# Each subdirectory must supply rules for building sources it contributes
component/serial_manager/%.o: ../component/serial_manager/%.c component/serial_manager/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DPRINTF_ADVANCED_ENABLE=1 -DPRINTF_FLOAT_ENABLE=1 -DFREESCALE_KSDK_BM -DMBEDTLS_CONFIG_FILE='"ksdk_mbedtls_config.h"' -DFRDM_K64F -DFREEDOM -DSERIAL_PORT_TYPE_UART=1 -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\source" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\drivers" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\mmcau" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\mbedtls\include" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\mbedtls\library" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\mbedtls\port\ksdk" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\utilities" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\device" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\component\uart" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\component\serial_manager" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\component\lists" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\CMSIS" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\board" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\frdmk64f_mbedtls_benchmark\frdmk64f\mbedtls_examples\mbedtls_benchmark" -O0 -fno-common -g3 -fomit-frame-pointer -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-serial_manager

clean-component-2f-serial_manager:
	-$(RM) ./component/serial_manager/fsl_component_serial_manager.d ./component/serial_manager/fsl_component_serial_manager.o ./component/serial_manager/fsl_component_serial_port_uart.d ./component/serial_manager/fsl_component_serial_port_uart.o

.PHONY: clean-component-2f-serial_manager

