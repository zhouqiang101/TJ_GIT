cmd_arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gcc -E -Wp,-MD,arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.dts.tmp arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts ; ./scripts/dtc/dtc -@ -O dtb -o arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb -b 0 -iarch/arm/boot/dts/ -i./scripts/dtc/include-prefixes -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.d.dtc.tmp arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.dts.tmp ; cat arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.d.pre.tmp arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.d.dtc.tmp > arch/arm/boot/dts/.sun8i-a23-ippo-q8h-v5.dtb.d

source_arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb := arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts

deps_arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb := \
  arch/arm/boot/dts/sun8i-a23.dtsi \
  arch/arm/boot/dts/sun8i-a23-a33.dtsi \
  arch/arm/boot/dts/skeleton.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/sun8i-a23-a33-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/reset/sun8i-a23-a33-ccu.h \
  arch/arm/boot/dts/sun8i-q8-common.dtsi \
  arch/arm/boot/dts/sunxi-reference-design-tablet.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \
  scripts/dtc/include-prefixes/dt-bindings/input/input.h \
  scripts/dtc/include-prefixes/dt-bindings/input/linux-event-codes.h \
  arch/arm/boot/dts/sunxi-common-regulators.dtsi \
  arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/pwm/pwm.h \
  arch/arm/boot/dts/axp223.dtsi \
  arch/arm/boot/dts/axp22x.dtsi \

arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb: $(deps_arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb)

$(deps_arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dtb):
