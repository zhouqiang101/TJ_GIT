cmd_net/batman-adv/batman-adv.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/batman-adv/batman-adv.ko net/batman-adv/batman-adv.o net/batman-adv/batman-adv.mod.o ;  true
