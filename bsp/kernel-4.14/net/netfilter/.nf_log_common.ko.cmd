cmd_net/netfilter/nf_log_common.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/netfilter/nf_log_common.ko net/netfilter/nf_log_common.o net/netfilter/nf_log_common.mod.o ;  true