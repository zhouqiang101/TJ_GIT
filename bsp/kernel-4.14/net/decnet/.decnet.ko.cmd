cmd_net/decnet/decnet.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/decnet/decnet.ko net/decnet/decnet.o net/decnet/decnet.mod.o ;  true
