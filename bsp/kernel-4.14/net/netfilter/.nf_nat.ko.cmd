cmd_net/netfilter/nf_nat.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/netfilter/nf_nat.ko net/netfilter/nf_nat.o net/netfilter/nf_nat.mod.o ;  true
