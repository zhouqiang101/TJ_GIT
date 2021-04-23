cmd_net/bridge/bridge.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/bridge/bridge.ko net/bridge/bridge.o net/bridge/bridge.mod.o ;  true
