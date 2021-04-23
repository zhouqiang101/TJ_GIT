cmd_arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gcc -E -Wp,-MD,arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.dts.tmp arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts ; ./scripts/dtc/dtc -@ -O dtb -o arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb -b 0 -iarch/arm/boot/dts/ -i./scripts/dtc/include-prefixes -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.d.dtc.tmp arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.dts.tmp ; cat arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.d.pre.tmp arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.d.dtc.tmp > arch/arm/boot/dts/.sun8i-a83t-cubietruck-plus.dtb.d

source_arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb := arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts

deps_arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb := \
  arch/arm/boot/dts/sun8i-a83t.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/sun8i-a83t-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/sun8i-r-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/reset/sun8i-a83t-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/reset/sun8i-r-ccu.h \
  arch/arm/boot/dts/sunxi-common-regulators.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \

arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb: $(deps_arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb)

$(deps_arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dtb):