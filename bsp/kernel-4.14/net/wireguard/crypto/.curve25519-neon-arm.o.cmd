cmd_net/wireguard/crypto/curve25519-neon-arm.o := arm-linux-gcc -Wp,-MD,net/wireguard/crypto/.curve25519-neon-arm.o.d  -nostdinc -isystem /usr/local/arm/5.4.0/bin/../lib/gcc/arm-none-linux-gnueabi/5.4.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ -fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -DCC_HAVE_ASM_GOTO   -c -o net/wireguard/crypto/curve25519-neon-arm.o net/wireguard/crypto/curve25519-neon-arm.S

source_net/wireguard/crypto/curve25519-neon-arm.o := net/wireguard/crypto/curve25519-neon-arm.S

deps_net/wireguard/crypto/curve25519-neon-arm.o := \
  include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/cpu/v7m.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  include/linux/linkage.h \
  include/linux/stringify.h \
  include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  arch/arm/include/asm/linkage.h \

net/wireguard/crypto/curve25519-neon-arm.o: $(deps_net/wireguard/crypto/curve25519-neon-arm.o)

$(deps_net/wireguard/crypto/curve25519-neon-arm.o):
