cmd_spl/lib/ctype.o := arm-linux-gcc -Wp,-MD,spl/lib/.ctype.o.d  -nostdinc -isystem /usr/local/arm/5.4.0/bin/../lib/gcc/arm-none-linux-gnueabi/5.4.0/include -Iinclude    -I./arch/arm/include -include ./include/linux/kconfig.h -D__KERNEL__ -D__UBOOT__ -DCONFIG_SPL_BUILD -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -fshort-wchar -Os -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage -Wno-format-nonliteral -Werror=date-time -ffunction-sections -fdata-sections -D__ARM__ -Wa,-mimplicit-it=always -mthumb -mthumb-interwork -mabi=aapcs-linux -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a -D__LINUX_ARM_ARCH__=7 -I./arch/arm/mach-sunxi/include    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ctype)"  -D"KBUILD_MODNAME=KBUILD_STR(ctype)" -c -o spl/lib/ctype.o lib/ctype.c

source_spl/lib/ctype.o := lib/ctype.c

deps_spl/lib/ctype.o := \
  include/linux/ctype.h \

spl/lib/ctype.o: $(deps_spl/lib/ctype.o)

$(deps_spl/lib/ctype.o):
