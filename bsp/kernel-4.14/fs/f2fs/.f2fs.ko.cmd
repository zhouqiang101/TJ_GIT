cmd_fs/f2fs/f2fs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/f2fs/f2fs.ko fs/f2fs/f2fs.o fs/f2fs/f2fs.mod.o ;  true
