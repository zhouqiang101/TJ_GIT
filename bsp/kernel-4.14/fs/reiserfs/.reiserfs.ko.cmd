cmd_fs/reiserfs/reiserfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/reiserfs/reiserfs.ko fs/reiserfs/reiserfs.o fs/reiserfs/reiserfs.mod.o ;  true
