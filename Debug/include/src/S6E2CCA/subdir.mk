################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../include/src/S6E2CCA/audio.c \
../include/src/S6E2CCA/delay.c \
../include/src/S6E2CCA/dstc.c \
../include/src/S6E2CCA/gpio.c \
../include/src/S6E2CCA/i2c.c \
../include/src/S6E2CCA/i2s.c \
../include/src/S6E2CCA/system_s6e2cc.c 

S_UPPER_SRCS += \
../include/src/S6E2CCA/Astartup_s6e2cc.S 

OBJS += \
./include/src/S6E2CCA/Astartup_s6e2cc.o \
./include/src/S6E2CCA/audio.o \
./include/src/S6E2CCA/delay.o \
./include/src/S6E2CCA/dstc.o \
./include/src/S6E2CCA/gpio.o \
./include/src/S6E2CCA/i2c.o \
./include/src/S6E2CCA/i2s.o \
./include/src/S6E2CCA/system_s6e2cc.o 

S_UPPER_DEPS += \
./include/src/S6E2CCA/Astartup_s6e2cc.d 

C_DEPS += \
./include/src/S6E2CCA/audio.d \
./include/src/S6E2CCA/delay.d \
./include/src/S6E2CCA/dstc.d \
./include/src/S6E2CCA/gpio.d \
./include/src/S6E2CCA/i2c.d \
./include/src/S6E2CCA/i2s.d \
./include/src/S6E2CCA/system_s6e2cc.d 


# Each subdirectory must supply rules for building sources it contributes
include/src/S6E2CCA/%.o: ../include/src/S6E2CCA/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -munaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -x assembler-with-cpp -DDEBUG -DTRACE -IF:/ARM/workspace-Neon/test_plugin/include -IF:/ARM/workspace-Neon/test_plugin/system/include -IF:/ARM/workspace-Neon/test_plugin/system/include/cmsis -IF:/ARM/workspace-Neon/test_plugin/system/include/S6E2CCA -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

include/src/S6E2CCA/%.o: ../include/src/S6E2CCA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -munaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -DDEBUG -DTRACE -IF:/ARM/workspace-Neon/test_plugin/include -IF:/ARM/workspace-Neon/test_plugin/system/include -IF:/ARM/workspace-Neon/test_plugin/system/include/cmsis -IF:/ARM/workspace-Neon/test_plugin/system/include/S6E2CCA -std=gnu11 -Wmissing-prototypes -Wstrict-prototypes -Wbad-function-cast -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


