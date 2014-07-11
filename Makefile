# Toolchain prefix (arm-elf- -> arm-elf-gcc.exe)
TCHAIN_PREFIX = /usr/local/arm/arm-2010.09/bin/arm-none-eabi-

#Thumb是ARM体系结构中一种16位的指令集。
USE_THUMB_MODE = YES

# MCU name and submodel
# - MCU used for compiler-option (-mcpu)
# - SUBMDL used for linker-script name (-T) and passed as define
MCU      = cortex-m3
CHIP     = LPC1768

#表示程序在FLASH 中运行
# *** This example only supports "FLASH_RUN" ***
# RUN_MODE is passed as define and used for the linker-script filename,
# the user has to implement the necessary operations for 
# the used mode (i.e. no copy of .data, remapping...)
# Create FLASH-Image
RUN_MODE = ./Chip/LPC1764/Obj
# Create RAM-Image
#RUN_MODE=RAM_RUN


#表示中断向量表在FLASH中
# *** This example only supports "VECT_TAB_FLASH" ***
# Exception-vectors placement option is just passed as define,
# the user has to implement the necessary operations (i.e. remapping)
# Exception vectors in FLASH:
VECTOR_TABLE_LOCATION=VECT_TAB_FLASH
# Exception vectors in RAM:
#VECTOR_TABLE_LOCATION=VECT_TAB_RAM

#输出目录
# Directory for output files (lst, obj, dep, elf, sym, map, hex, bin etc.)
OUTDIR = $(RUN_MODE)

# Target file name (without extension).
TARGETCOMM = ./Common
TARGETCOMMSRC = $(TARGETCOMM)/Src
TARGETCOMMINC = $(TARGETCOMM)/Inc
# Utility variables
APPLIBDIR = ./Chip/LPC1764
NXPDIR = $(APPLIBDIR)/NXP
NXPDRVDIR = $(NXPDIR)/Drivers
NXPDRVSRCDIR = $(NXPDRVDIR)/source
NXPDRVINCDIR = $(NXPDRVDIR)include
CMSISCOREDIR = $(NXPDIR)/Core/CM3/CoreSupport
CMSISDEVDIR = $(NXPDIR)/Core/CM3/DeviceSupport/NXP/LPC17xx

# 源 C 代码列表
# List C source files here. (C dependencies are automatically generated.)
# use file-extension c for "c-only"-files
# Demo-Application:

# 1. COMMON
SRC = $(TARGETCOMMSRC)/main.c
# 2.CMSIS
SRC += $(CMSISCOREDIR)/core_cm3.c
SRC += $(CMSISDEVDIR)/system_LPC17xx.c
#3. NXP Drivers
SRC += $(NXPDRVSRCDIR)/lpc17xx_clkpwr.c
SRC += $(NXPDRVSRCDIR)/lpc17xx_pinsel.c
SRC += $(NXPDRVSRCDIR)/lpc17xx_gpio.c
SRC += $(NXPDRVSRCDIR)/lpc17xx_uart.c

# 汇编代码列表
# List Assembler source files here.













