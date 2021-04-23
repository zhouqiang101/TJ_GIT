cmd_fs/bfs/bfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/bfs/bfs.ko fs/bfs/bfs.o fs/bfs/bfs.mod.o ;  true
