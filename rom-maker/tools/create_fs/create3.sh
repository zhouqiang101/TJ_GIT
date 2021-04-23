#!/bin/bash

source ${RML_PRJ}/tools/global.sh

out=$1
partmap=$2
misc_dir=$3
misc_sz=$4
part1_dir=$5
part1_sz=$6
part2_dir=$7
part2_sz=$8

part1_lb=`grep "boot.img" ${partmap} | cut -f 2 -d :`
part2_lb=`grep "rootfs.img" ${partmap} | cut -f 2 -d :`
run_cmd "cp -rf ${misc_dir}/* ${out}/"
run_cmd "cp -rf ${partmap} ${out}/"

pt_info "Making ${misc_sz}MB misc(bootloader) + ${part1_sz}MB ${part1_lb}.img(ext4 boot) + ${part2_sz}MB ${part2_lb}.img(ext4 rootfs)..."
run_cmd "./tools/mk_fsimg.sh ext4 ${out}/${part1_lb}.img ${part1_dir} ${part1_sz} ${part1_lb}"
run_cmd "./tools/mk_fsimg.sh ext4 ${out}/${part2_lb}.img ${part2_dir} ${part2_sz} ${part2_lb}"
