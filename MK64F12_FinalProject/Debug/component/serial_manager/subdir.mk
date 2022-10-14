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
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -DMBEDTLS_CONFIG_FILE='"ksdk_mbedtls_config.h"' -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\board" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\source" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\drivers" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\device" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\CMSIS" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\utilities" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\component\serial_manager" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\component\uart" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mmcau" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mbedtls\include" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mbedtls\library" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\mbedtls\port\ksdk" -I"C:\Users\nxf63523\Documents\Especialidad\Seguridad y Software\SecurityWorkspace\MK64F12_FinalProject\component\lists" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-serial_manager

clean-component-2f-serial_manager:
	-$(RM) ./component/serial_manager/fsl_component_serial_manager.d ./component/serial_manager/fsl_component_serial_manager.o ./component/serial_manager/fsl_component_serial_port_uart.d ./component/serial_manager/fsl_component_serial_port_uart.o

.PHONY: clean-component-2f-serial_manager

