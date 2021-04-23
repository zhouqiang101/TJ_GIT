cmd_fs/gfs2/gfs2.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/gfs2/gfs2.ko fs/gfs2/gfs2.o fs/gfs2/gfs2.mod.o ;  true
