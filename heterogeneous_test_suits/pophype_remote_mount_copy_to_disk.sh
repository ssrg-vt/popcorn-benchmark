#! /bin/bash
# Copyright (C) 2022 Ho-Ren (Jack) Chuang <horenc@vt.edu>
# Distributed under terms of the MIT license.
#

echo "$0 start. Input: $1"
COPY_ROOTFSIMG_FOR_BASELINE=$1
WORK_SPACE="/home/jackchuang/stramash-QEMU"
X86_NODE="echo5"
X86_MOUNT="mount_x86"
X86_VMDISK="x86_rootfs.img"
ARM_NODE="fox5"
ARM_MOUNT="mount_arm"
ARM_VMDISK="arm_rootfs.img"
BASELINE="Stramash-QEMU-originbaseline220224"
#ssh $X86_NODE "sudo bash -c \"uname -a\""
#ssh $ARM_NODE "sudo bash -c \"uname -a\""
ret=0


declare -a arr=("basic"  "migrate_one_time"  "migrate_two_times"  "kmeans")
declare -a arr_npb=("bt"  "cg"  "dc"  "ep"  "ft"  "is"  "lu"  "mg"  "sp"  "ua")

###
# mount
###
echo "mount X86"
ssh $X86_NODE "mkdir $WORK_SPACE/$X86_MOUNT"
ssh $X86_NODE "sudo bash -c \"sudo mount $WORK_SPACE/$X86_VMDISK $WORK_SPACE/$X86_MOUNT\""
ret=$(($ret+$?))
echo "mount ARM"
ssh $ARM_NODE "mkdir $WORK_SPACE/$ARM_MOUNT"
ssh $ARM_NODE "sudo bash -c \"sudo mount $WORK_SPACE/$ARM_VMDISK $WORK_SPACE/$ARM_MOUNT\"" #
ret=$(($ret+$?))

echo -e "\n\n=========================\nCopy general APPs to X86 & ARM\n=========================\n\n"
for app in "${arr[@]}"
do
	echo -e "\nCopy $app to X86 & ARM"
	# Copy to X86
	scp ${app}/${app}_x86-64 $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	scp ${app}/${app}_aarch64 $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app}_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app}_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app}_x86-64 $WORK_SPACE/$X86_MOUNT/${app}\""; ret=$(($ret+$?))
	ssh $X86_NODE "rm $WORK_SPACE/${app}_x86-64"; ret=$(($ret+$?))
	ssh $X86_NODE "rm $WORK_SPACE/${app}_aarch64"; ret=$(($ret+$?))

	# Copy to ARM
	scp ${app}/${app}_x86-64 $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	scp ${app}/${app}_aarch64 $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app}_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app}_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app}_aarch64 $WORK_SPACE/$ARM_MOUNT/${app}\""; ret=$(($ret+$?))
	ssh $ARM_NODE "rm $WORK_SPACE/${app}_x86-64"; ret=$(($ret+$?))
	ssh $ARM_NODE "rm $WORK_SPACE/${app}_aarch64"; ret=$(($ret+$?))
done

echo -e "\n\n=========================\nCopy NPB to X86 & ARM\n=========================\n\n"
for app_npb in "${arr_npb[@]}"
do
	echo -e "\nCopy $app_npb to X86 & ARM"
	# Copy to X86
	scp NPB3.3-SER-C-FLAT-popcorn-explicit/${app_npb}/${app_npb}_x86-64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	scp NPB3.3-SER-C-FLAT-popcorn-explicit/${app_npb}/${app_npb}_aarch64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_x86-64 $WORK_SPACE/$X86_MOUNT/${app_npb}.a\""; ret=$(($ret+$?))
	ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_x86-64 $WORK_SPACE/$X86_MOUNT/${app_npb}\""; ret=$(($ret+$?)) # test
	ssh $X86_NODE "rm $WORK_SPACE/${app_npb}_x86-64"; ret=$(($ret+$?))
	ssh $X86_NODE "rm $WORK_SPACE/${app_npb}_aarch64"; ret=$(($ret+$?))

	# Copy to ARM
	scp NPB3.3-SER-C-FLAT-popcorn-explicit/${app_npb}/${app_npb}_x86-64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	scp NPB3.3-SER-C-FLAT-popcorn-explicit/${app_npb}/${app_npb}_aarch64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_aarch64 $WORK_SPACE/$ARM_MOUNT/${app_npb}.a\""; ret=$(($ret+$?))
	ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/${app_npb}_aarch64 $WORK_SPACE/$ARM_MOUNT/${app_npb}\""; ret=$(($ret+$?)) # test
	ssh $ARM_NODE "rm $WORK_SPACE/${app_npb}_x86-64"; ret=$(($ret+$?))
	ssh $ARM_NODE "rm $WORK_SPACE/${app_npb}_aarch64"; ret=$(($ret+$?))
done

###
# debug
###
echo "=== debug X86 ==="
ssh $X86_NODE "ls -al $WORK_SPACE/$X86_MOUNT"
ssh $X86_NODE "du -sh $WORK_SPACE/$X86_VMDISK"
echo "=== debug ARM ==="
ssh $ARM_NODE "ls -al $WORK_SPACE/$ARM_MOUNT"
ssh $ARM_NODE "du -sh $WORK_SPACE/$ARM_VMDISK"

###
# umount
###
echo "=== unmount X86 ==="
ssh $X86_NODE "sudo bash -c \"sudo umount $WORK_SPACE/$X86_MOUNT\""
ret=$(($ret+$?))

echo "=== unmount ARM ==="
ssh $ARM_NODE "sudo bash -c \"sudo umount $WORK_SPACE/$ARM_MOUNT\""
ret=$(($ret+$?))
echo "ret $ret"


##################################################
# 2-stage copy

#### x86
#NOW="X86"
#ret=$?
#echo "mount $NOW"
#ssh $X86_NODE "mkdir $WORK_SPACE/$X86_MOUNT"
#ssh $X86_NODE "sudo bash -c \"sudo mount $WORK_SPACE/$X86_VMDISK $WORK_SPACE/$X86_MOUNT\"" #
#ret=$(($ret+$?))
#
#
####
#echo "copy $NOW"
##sudo cp -r NPB_bin $X86_MOUNT/
#scp basic/basic_x86-64 $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp basic/basic_aarch64 $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/basic_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/basic_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/basic_x86-64 $WORK_SPACE/$X86_MOUNT/basic\""; ret=$(($ret+$?))
#ssh $X86_NODE "rm $WORK_SPACE/basic_x86-64"; ret=$(($ret+$?))
#ssh $X86_NODE "rm $WORK_SPACE/basic_aarch64"; ret=$(($ret+$?))
#scp migrate_one_time/migrate_one_time_x86-64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp migrate_one_time/migrate_one_time_aarch64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_one_time_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_one_time_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_one_time_x86-64 $WORK_SPACE/$X86_MOUNT/migrate_one_time\""; ret=$(($ret+$?))
#scp migrate_two_times/migrate_two_times_x86-64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp migrate_two_times/migrate_two_times_aarch64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_two_times_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_two_times_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_two_times_x86-64 $WORK_SPACE/$X86_MOUNT/migrate_two_times\""; ret=$(($ret+$?))
#scp kmeans/kmeans_x86-64 $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp kmeans/kmeans_aarch64 $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/kmeans_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/kmeans_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/kmeans_x86-64 $WORK_SPACE/$X86_MOUNT/kmeans\""; ret=$(($ret+$?))
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/ep/ep_x86-64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/ep/ep_aarch64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_x86-64 $WORK_SPACE/$X86_MOUNT/ep.a\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_x86-64 $WORK_SPACE/$X86_MOUNT/ep\""; ret=$(($ret+$?)) # test
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/bt/bt_x86-64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/bt/bt_aarch64  $X86_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_x86-64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_aarch64 $WORK_SPACE/$X86_MOUNT\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_x86-64 $WORK_SPACE/$X86_MOUNT/bt.a\""; ret=$(($ret+$?))
#ssh $X86_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_x86-64 $WORK_SPACE/$X86_MOUNT/bt\""; ret=$(($ret+$?)) # test
####
#
####
#
#
#echo "debug $NOW"
#ssh $X86_NODE "ls -al $WORK_SPACE/$X86_MOUNT"
#
#echo "unmount $NOW"
#ssh $X86_NODE "sudo bash -c \"sudo umount $WORK_SPACE/$X86_MOUNT\""
#ret=$(($ret+$?))
#echo "ret $ret"
#
#### arm
#NOW="ARM"
#echo "mount $NOW"
#ssh $ARM_NODE "mkdir $WORK_SPACE/$ARM_MOUNT"
#ssh $ARM_NODE "sudo bash -c \"sudo mount $WORK_SPACE/$ARM_VMDISK $WORK_SPACE/$ARM_MOUNT\"" #
#ret=$(($ret+$?))
#
#
####
#echo "copy $NOW"
##sudo cp -r NPB_bin $ARM_MOUNT/
#scp basic/basic_x86-64 $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp basic/basic_aarch64 $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/basic_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/basic_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/basic_aarch64 $WORK_SPACE/$ARM_MOUNT/basic\""; ret=$(($ret+$?))
#ssh $ARM_NODE "rm $WORK_SPACE/basic_x86-64"; ret=$(($ret+$?))
#ssh $ARM_NODE "rm $WORK_SPACE/basic_aarch64"; ret=$(($ret+$?))
#scp migrate_one_time/migrate_one_time_x86-64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp migrate_one_time/migrate_one_time_aarch64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_one_time_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_one_time_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_one_time_aarch64 $WORK_SPACE/$ARM_MOUNT/migrate_one_time\""; ret=$(($ret+$?))
#scp migrate_two_times/migrate_two_times_x86-64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp migrate_two_times/migrate_two_times_aarch64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_two_times_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_two_times_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/migrate_two_times_aarch64 $WORK_SPACE/$ARM_MOUNT/migrate_two_times\""; ret=$(($ret+$?))
#scp kmeans/kmeans_x86-64 $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp kmeans/kmeans_aarch64 $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/kmeans_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/kmeans_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/kmeans_aarch64 $WORK_SPACE/$ARM_MOUNT/kmeans\""; ret=$(($ret+$?))
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/ep/ep_x86-64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/ep/ep_aarch64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_aarch64 $WORK_SPACE/$ARM_MOUNT/ep.a\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/ep_aarch64 $WORK_SPACE/$ARM_MOUNT/ep\""; ret=$(($ret+$?)) # test
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/bt/bt_x86-64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#scp NPB3.3-SER-C-FLAT-popcorn-explicit/bt/bt_aarch64  $ARM_NODE:$WORK_SPACE/; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_x86-64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_aarch64 $WORK_SPACE/$ARM_MOUNT\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_aarch64 $WORK_SPACE/$ARM_MOUNT/bt.a\""; ret=$(($ret+$?))
#ssh $ARM_NODE "sudo bash -c \"sudo cp $WORK_SPACE/bt_aarch64 $WORK_SPACE/$ARM_MOUNT/bt\""; ret=$(($ret+$?)) # test
####
#
#
#echo "debug $NOW"
#ssh $ARM_NODE "ls -al $WORK_SPACE/$ARM_MOUNT"
#
#echo "unmount $NOW"
#ssh $ARM_NODE "sudo bash -c \"sudo umount $WORK_SPACE/$ARM_MOUNT\""
#ret=$(($ret+$?))
#

#
#
#
#
#Stramash-QEMU-originbaseline220224
if [[ $COPY_ROOTFSIMG_FOR_BASELINE == "1" ]]; then
    echo "cpy vmdisks from ${X86_NODE}&${ARM_NODE} to \"$X86_NODE:~/$BASELINE\""
    echo "cpy $X86_VMDISK for baseline"
    scp $X86_NODE:$WORK_SPACE/$X86_VMDISK $X86_NODE:~/$BASELINE
    ret=$(($ret+$?))
    echo "cpy $ARM_VMDISK for baseline"
    scp $ARM_NODE:$WORK_SPACE/$ARM_VMDISK $X86_NODE:~/$BASELINE
    ret=$(($ret+$?))
    ssh $X86_NODE "ls -al ~/$BASELINE |egrep \"rootfs|Image_dev\""
else
    echo -e "\n\n\n"
    echo "SKIP COPYING ROOTFS image to baseline"
    echo -e "\n\n\n"
fi

if [[ $ret != 0 ]]; then
    echo "(BAD) $0 done ret $ret"
else
    echo "(GOOD) $0 done ret $ret"
fi
