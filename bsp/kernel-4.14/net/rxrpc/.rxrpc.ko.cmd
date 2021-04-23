cmd_net/rxrpc/rxrpc.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/rxrpc/rxrpc.ko net/rxrpc/rxrpc.o net/rxrpc/rxrpc.mod.o ;  true
