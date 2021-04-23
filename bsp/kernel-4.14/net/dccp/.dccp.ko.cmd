cmd_net/dccp/dccp.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/dccp/dccp.ko net/dccp/dccp.o net/dccp/dccp.mod.o ;  true
