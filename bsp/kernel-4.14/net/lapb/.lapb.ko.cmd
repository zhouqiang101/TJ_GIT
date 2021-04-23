cmd_net/lapb/lapb.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/lapb/lapb.ko net/lapb/lapb.o net/lapb/lapb.mod.o ;  true
