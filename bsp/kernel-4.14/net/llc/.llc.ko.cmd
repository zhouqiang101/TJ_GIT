cmd_net/llc/llc.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/llc/llc.ko net/llc/llc.o net/llc/llc.mod.o ;  true
