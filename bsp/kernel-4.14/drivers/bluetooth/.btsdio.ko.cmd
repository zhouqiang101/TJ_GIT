cmd_drivers/bluetooth/btsdio.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/bluetooth/btsdio.ko drivers/bluetooth/btsdio.o drivers/bluetooth/btsdio.mod.o ;  true
