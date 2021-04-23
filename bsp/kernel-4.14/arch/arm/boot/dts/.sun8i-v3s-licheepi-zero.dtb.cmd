cmd_arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gcc -E -Wp,-MD,arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.dts.tmp arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts ; ./scripts/dtc/dtc -@ -O dtb -o arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb -b 0 -iarch/arm/boot/dts/ -i./scripts/dtc/include-prefixes -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.d.dtc.tmp arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.dts.tmp ; cat arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.d.pre.tmp arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.d.dtc.tmp > arch/arm/boot/dts/.sun8i-v3s-licheepi-zero.dtb.d

source_arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb := arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts

deps_arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb := \
  arch/arm/boot/dts/sun8i-v3s.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/sun8i-v3s-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/reset/sun8i-v3s-ccu.h \
  arch/arm/boot/dts/sunxi-common-regulators.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \

arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb: $(deps_arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb)

$(deps_arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dtb):
