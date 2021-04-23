cmd_net/ceph/libceph.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/ceph/libceph.ko net/ceph/libceph.o net/ceph/libceph.mod.o ;  true
