cmd_fs/orangefs/orangefs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/orangefs/orangefs.ko fs/orangefs/orangefs.o fs/orangefs/orangefs.mod.o ;  true
