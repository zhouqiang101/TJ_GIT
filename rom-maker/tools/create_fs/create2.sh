#!/bin/bash

source ${RML_PRJ}/tools/global.sh
DBG_INFO filename $0

out=$1
partmap=$2
misc_dir=$3
misc_sz=$4
part1_dir=$5
part1_sz=$6
part2_dir=$7
part2_sz=$8
part3_dir=$9
part3_sz=${10}

part1_lb=`grep "boot.img" ${partmap} | cut -f 2 -d :`
part2_lb=`grep "rootfs.img" ${partmap} | cut -f 2 -d :`
part3_lb=`grep "app.img" ${partmap} | cut -f 2 -d :`
run_cmd "cp -rf ${misc_dir}/* ${out}/"
run_cmd "cp -rf ${partmap} ${out}/"

pt_info "Creating ${misc_sz}MB misc + ${part1_sz}MB fat32 ${part1_lb}.img + ${part2_sz}MB ext4 ${part2_lb} + ${part3_sz}MB ext4 ${part3_lb}.img"
run_cmd "./tools/mk_fsimg.sh vfat ${out}/${part1_lb}.img ${part1_dir} ${part1_sz} ${part1_lb}"
run_cmd "./tools/mk_fsimg.sh ext4 ${out}/${part2_lb}.img ${part2_dir} ${part2_sz} ${part2_lb}"
run_cmd "./tools/mk_fsimg.sh ext4 ${out}/${part3_lb}.img ${part3_dir} ${part3_sz} ${part3_lb}"
