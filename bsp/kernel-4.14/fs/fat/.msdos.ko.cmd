cmd_fs/fat/msdos.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/fat/msdos.ko fs/fat/msdos.o fs/fat/msdos.mod.o ;  true
