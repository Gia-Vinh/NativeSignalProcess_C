################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../system/include/S6E2CCA/audio.c \
../system/include/S6E2CCA/delay.c \
../system/include/S6E2CCA/dstc.c \
../system/include/S6E2CCA/gpio.c \
../system/include/S6E2CCA/i2c.c \
../system/include/S6E2CCA/i2s.c \
../system/include/S6E2CCA/system_s6e2cc.c 

S_UPPER_SRCS += \
../system/include/S6E2CCA/startup_s6e2cc.S 

OBJS += \
./system/include/S6E2CCA/audio.o \
./system/include/S6E2CCA/delay.o \
./system/include/S6E2CCA/dstc.o \
./system/include/S6E2CCA/gpio.o \
./system/include/S6E2CCA/i2c.o \
./system/include/S6E2CCA/i2s.o \
./system/include/S6E2CCA/startup_s6e2cc.o \
./system/include/S6E2CCA/system_s6e2cc.o 

S_UPPER_DEPS += \
./system/include/S6E2CCA/startup_s6e2cc.d 

C_DEPS += \
./system/include/S6E2CCA/audio.d \
./system/include/S6E2CCA/delay.d \
./system/include/S6E2CCA/dstc.d \
./system/include/S6E2CCA/gpio.d \
./system/include/S6E2CCA/i2c.d \
./system/include/S6E2CCA/i2s.d \
./system/include/S6E2CCA/system_s6e2cc.d 


# Each subdirectory must supply rules for building sources it contributes
system/include/S6E2CCA/%.o: ../system/include/S6E2CCA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -munaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants  -g3 -DDEBUG -DTRACE -D__FPU_PRESENT -DARM_MATH_CM4 -I"D:\workspace\test_plugin\include" -I"D:\workspace\test_plugin\system\include" -I"D:\workspace\test_plugin\system\include\cmsis" -I"D:\workspace\test_plugin\system\include\S6E2CCA" -std=gnu11 -Wmissing-prototypes -Wstrict-prototypes -Wbad-function-cast -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

system/include/S6E2CCA/%.o: ../system/include/S6E2CCA/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -munaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants  -g3 -x assembler-with-cpp -DDEBUG -DTRACE -I"D:\workspace\test_plugin\include" -I"D:\workspace\test_plugin\system\include" -I"D:\workspace\test_plugin\system\include\cmsis" -I"D:\workspace\test_plugin\system\include\S6E2CCA" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


