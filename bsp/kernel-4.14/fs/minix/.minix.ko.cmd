cmd_fs/minix/minix.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/minix/minix.ko fs/minix/minix.o fs/minix/minix.mod.o ;  true
