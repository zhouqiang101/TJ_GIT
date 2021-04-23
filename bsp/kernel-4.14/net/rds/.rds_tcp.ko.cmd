cmd_net/rds/rds_tcp.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/rds/rds_tcp.ko net/rds/rds_tcp.o net/rds/rds_tcp.mod.o ;  true
