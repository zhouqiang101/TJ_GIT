cmd_arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gcc -E -Wp,-MD,arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.dts.tmp arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dts ; ./scripts/dtc/dtc -@ -O dtb -o arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb -b 0 -iarch/arm/boot/dts/ -i./scripts/dtc/include-prefixes -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.d.dtc.tmp arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.dts.tmp ; cat arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.d.pre.tmp arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.d.dtc.tmp > arch/arm/boot/dts/.sun5i-a13-empire-electronix-m712.dtb.d

source_arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb := arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dts

deps_arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb := \
  arch/arm/boot/dts/sun5i-a13.dtsi \
  arch/arm/boot/dts/skeleton.dtsi \
  arch/arm/boot/dts/sun5i.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/clock/sun5i-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/dma/sun4i-a10.h \
  scripts/dtc/include-prefixes/dt-bindings/reset/sun5i-ccu.h \
  scripts/dtc/include-prefixes/dt-bindings/thermal/thermal.h \
  arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi \
  arch/arm/boot/dts/sunxi-reference-design-tablet.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \
  scripts/dtc/include-prefixes/dt-bindings/input/input.h \
  scripts/dtc/include-prefixes/dt-bindings/input/linux-event-codes.h \
  arch/arm/boot/dts/sunxi-common-regulators.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  scripts/dtc/include-prefixes/dt-bindings/pwm/pwm.h \
  arch/arm/boot/dts/axp209.dtsi \

arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb: $(deps_arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb)

$(deps_arch/arm/boot/dts/sun5i-a13-empire-electronix-m712.dtb):
