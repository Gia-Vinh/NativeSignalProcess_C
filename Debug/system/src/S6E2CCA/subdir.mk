################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../system/src/S6E2CCA/audio.c \
../system/src/S6E2CCA/delay.c \
../system/src/S6E2CCA/dstc.c \
../system/src/S6E2CCA/gpio.c \
../system/src/S6E2CCA/i2c.c \
../system/src/S6E2CCA/i2s.c \
../system/src/S6E2CCA/system_s6e2cc.c 

S_UPPER_SRCS += \
../system/src/S6E2CCA/startup_s6e2cc.S 

OBJS += \
./system/src/S6E2CCA/audio.o \
./system/src/S6E2CCA/delay.o \
./system/src/S6E2CCA/dstc.o \
./system/src/S6E2CCA/gpio.o \
./system/src/S6E2CCA/i2c.o \
./system/src/S6E2CCA/i2s.o \
./system/src/S6E2CCA/startup_s6e2cc.o \
./system/src/S6E2CCA/system_s6e2cc.o 

S_UPPER_DEPS += \
./system/src/S6E2CCA/startup_s6e2cc.d 

C_DEPS += \
./system/src/S6E2CCA/audio.d \
./system/src/S6E2CCA/delay.d \
./system/src/S6E2CCA/dstc.d \
./system/src/S6E2CCA/gpio.d \
./system/src/S6E2CCA/i2c.d \
./system/src/S6E2CCA/i2s.d \
./system/src/S6E2CCA/system_s6e2cc.d 


# Each subdirectory must supply rules for building sources it contributes
system/src/S6E2CCA/%.o: ../system/src/S6E2CCA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -DDEBUG -DTRACE -I"../include" -I"../system/include" -I"../system/include/cmsis" -I"../system/include/S6E2CCA" -std=gnu11 -Wmissing-prototypes -Wstrict-prototypes -Wbad-function-cast -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

system/src/S6E2CCA/%.o: ../system/src/S6E2CCA/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -x assembler-with-cpp -DDEBUG -DTRACE -I"../include" -I"../system/include" -I"../system/include/cmsis" -I"../system/include/S6E2CCA" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


