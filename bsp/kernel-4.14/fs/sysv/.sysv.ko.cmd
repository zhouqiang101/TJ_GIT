cmd_fs/sysv/sysv.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/sysv/sysv.ko fs/sysv/sysv.o fs/sysv/sysv.mod.o ;  true
