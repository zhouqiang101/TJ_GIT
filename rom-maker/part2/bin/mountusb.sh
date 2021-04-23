#!/bin/sh

LOG=/var/log/usb-hotplug.log
LOGTIME=$(date)

MNT_DIR=${DEVNAME##*/}
MOUNT_POINT=/media/$MNT_DIR
echo "$LOGTIME: $DEVPATH requesting $ACTION" >> $LOG

if [ "$ACTION" = "add" ]; then
	mkdir -p $MOUNT_POINT >>$LOG 2>&1
	mount $DEVNAME $MOUNT_POINT >>$LOG 2>&1
	if [ $? -ne 0 ]; then
		echo "Mount $DEVNAME failed" >>$LOG
		rmdir $MOUNT_POINT >>$LOG 2>&1
	else
		echo "$LOGTIME: mount $DEVNAME $MOUNT_POINT" >> $LOG
	fi
elif [ "$ACTION" = "remove" ]; then
	if [ -d "$MOUNT_POINT" ]; then
		umount $MOUNT_POINT >>$LOG 2>&1
		rmdir $MOUNT_POINT >>$LOG 2>&1
		echo "$LOGTIME: umount $DEVNAME -$ACTION" >> $LOG
	else
		echo "Skip umount of $DEVNAME" >> $LOG
	fi
fi
