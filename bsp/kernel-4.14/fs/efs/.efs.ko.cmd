cmd_fs/efs/efs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/efs/efs.ko fs/efs/efs.o fs/efs/efs.mod.o ;  true
