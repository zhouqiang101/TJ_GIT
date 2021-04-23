cmd_net/hsr/hsr.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/hsr/hsr.ko net/hsr/hsr.o net/hsr/hsr.mod.o ;  true
