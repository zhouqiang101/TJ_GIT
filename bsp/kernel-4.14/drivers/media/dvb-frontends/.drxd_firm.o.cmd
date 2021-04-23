cmd_drivers/media/dvb-frontends/drxd_firm.o := arm-linux-gcc -Wp,-MD,drivers/media/dvb-frontends/.drxd_firm.o.d  -nostdinc -isystem /usr/local/arm/5.4.0/bin/../lib/gcc/arm-none-linux-gnueabi/5.4.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -I./drivers/media/dvb-core/ -I./drivers/media/tuners/  -DMODULE  -DKBUILD_BASENAME='"drxd_firm"'  -DKBUILD_MODNAME='"drxd"' -c -o drivers/media/dvb-frontends/drxd_firm.o drivers/media/dvb-frontends/drxd_firm.c

source_drivers/media/dvb-frontends/drxd_firm.o := drivers/media/dvb-frontends/drxd_firm.c

deps_drivers/media/dvb-frontends/drxd_firm.o := \
    $(wildcard include/config//a.h) \
    $(wildcard include/config/fr/enable//m.h) \
    $(wildcard include/config/freqscan//m.h) \
    $(wildcard include/config/div/echo/enable//m.h) \
    $(wildcard include/config/slave//m.h) \
    $(wildcard include/config/div/blank/enable//m.h) \
  include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  drivers/media/dvb-frontends/drxd_firm.h \
  include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/uapi/linux/types.h \
  arch/arm/include/uapi/asm/types.h \
  include/asm-generic/int-ll64.h \
  include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/uapi/asm-generic/bitsperlong.h \
  include/uapi/linux/posix_types.h \
  include/linux/stddef.h \
  include/uapi/linux/stddef.h \
  arch/arm/include/uapi/asm/posix_types.h \
  include/uapi/asm-generic/posix_types.h \
  drivers/media/dvb-frontends/drxd_map_firm.h \

drivers/media/dvb-frontends/drxd_firm.o: $(deps_drivers/media/dvb-frontends/drxd_firm.o)

$(deps_drivers/media/dvb-frontends/drxd_firm.o):
