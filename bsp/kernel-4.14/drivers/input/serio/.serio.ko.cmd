cmd_drivers/input/serio/serio.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/input/serio/serio.ko drivers/input/serio/serio.o drivers/input/serio/serio.mod.o ;  true
