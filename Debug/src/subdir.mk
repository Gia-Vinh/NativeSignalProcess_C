################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/delay_intr.c 

OBJS += \
./src/delay_intr.o 

C_DEPS += \
./src/delay_intr.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -munaligned-access -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants  -g3 -DDEBUG -DTRACE -D__FPU_PRESENT -DARM_MATH_CM4 -I"D:\workspace\test_plugin\include" -I"D:\workspace\test_plugin\system\include" -I"D:\workspace\test_plugin\system\include\cmsis" -I"D:\workspace\test_plugin\system\include\S6E2CCA" -std=gnu11 -Wmissing-prototypes -Wstrict-prototypes -Wbad-function-cast -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


