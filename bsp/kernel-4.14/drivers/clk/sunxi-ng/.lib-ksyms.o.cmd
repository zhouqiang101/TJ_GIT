cmd_drivers/clk/sunxi-ng/lib-ksyms.o := arm-linux-objdump -h drivers/clk/sunxi-ng/lib.a | sed -ne '/___ksymtab/s/.*+\([^ ]*\).*/EXTERN(\1)/p' >drivers/clk/sunxi-ng/.lib-ksyms.o.lds; rm -f drivers/clk/sunxi-ng/.lib_exports.o; echo | arm-linux-gcc -Wp,-MD,drivers/clk/sunxi-ng/.lib-ksyms.o.d  -nostdinc -isystem /usr/local/arm/5.4.0/bin/../lib/gcc/arm-none-linux-gnueabi/5.4.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ -fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -DCC_HAVE_ASM_GOTO   -c -o drivers/clk/sunxi-ng/.lib_exports.o -x assembler -; arm-linux-ld -EL    -r -o drivers/clk/sunxi-ng/lib-ksyms.o -T drivers/clk/sunxi-ng/.lib-ksyms.o.lds drivers/clk/sunxi-ng/.lib_exports.o; rm drivers/clk/sunxi-ng/.lib_exports.o drivers/clk/sunxi-ng/.lib-ksyms.o.lds