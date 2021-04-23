cmd_net/tipc/tipc.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/tipc/tipc.ko net/tipc/tipc.o net/tipc/tipc.mod.o ;  true
