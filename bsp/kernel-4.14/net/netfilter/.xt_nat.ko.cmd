cmd_net/netfilter/xt_nat.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/netfilter/xt_nat.ko net/netfilter/xt_nat.o net/netfilter/xt_nat.mod.o ;  true
