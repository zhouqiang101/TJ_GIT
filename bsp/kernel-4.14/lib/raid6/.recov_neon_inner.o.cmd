cmd_lib/raid6/recov_neon_inner.o := arm-linux-gcc -Wp,-MD,lib/raid6/.recov_neon_inner.o.d  -nostdinc -isystem /usr/local/arm/5.4.0/bin/../lib/gcc/arm-none-linux-gnueabi/5.4.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -ffreestanding -mfloat-abi=softfp -mfpu=neon  -DMODULE  -DKBUILD_BASENAME='"recov_neon_inner"'  -DKBUILD_MODNAME='"raid6_pq"' -c -o lib/raid6/recov_neon_inner.o lib/raid6/recov_neon_inner.c

source_lib/raid6/recov_neon_inner.o := lib/raid6/recov_neon_inner.c

deps_lib/raid6/recov_neon_inner.o := \
    $(wildcard include/config/arm.h) \
  include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /usr/local/arm/5.4.0/lib/gcc/arm-none-linux-gnueabi/5.4.0/include/arm_neon.h \
  /usr/local/arm/5.4.0/lib/gcc/arm-none-linux-gnueabi/5.4.0/include/stdint.h \
  /usr/local/arm/5.4.0/lib/gcc/arm-none-linux-gnueabi/5.4.0/include/stdint-gcc.h \

lib/raid6/recov_neon_inner.o: $(deps_lib/raid6/recov_neon_inner.o)

$(deps_lib/raid6/recov_neon_inner.o):
