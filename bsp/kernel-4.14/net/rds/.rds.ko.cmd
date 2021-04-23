cmd_net/rds/rds.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/rds/rds.ko net/rds/rds.o net/rds/rds.mod.o ;  true
