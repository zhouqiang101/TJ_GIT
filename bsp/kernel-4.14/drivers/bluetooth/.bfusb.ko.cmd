cmd_drivers/bluetooth/bfusb.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/bfusb.ko drivers/bluetooth/bfusb.o drivers/bluetooth/bfusb.mod.o ;  true
