cmd_drivers/bluetooth/btintel.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/btintel.ko drivers/bluetooth/btintel.o drivers/bluetooth/btintel.mod.o ;  true
