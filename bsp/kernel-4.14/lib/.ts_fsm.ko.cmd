cmd_lib/ts_fsm.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o lib/ts_fsm.ko lib/ts_fsm.o lib/ts_fsm.mod.o ;  true
