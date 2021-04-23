cmd_fs/romfs/romfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/romfs/romfs.ko fs/romfs/romfs.o fs/romfs/romfs.mod.o ;  true
