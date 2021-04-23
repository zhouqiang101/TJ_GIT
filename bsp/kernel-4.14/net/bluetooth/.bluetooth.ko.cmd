cmd_net/bluetooth/bluetooth.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/bluetooth/bluetooth.ko net/bluetooth/bluetooth.o net/bluetooth/bluetooth.mod.o ;  true
