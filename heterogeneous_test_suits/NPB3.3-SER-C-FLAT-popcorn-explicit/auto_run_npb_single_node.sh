#! /bin/bash
# Copyright (C) 2022 Ho-Ren (Jack) Chuang <horenc@vt.edu>
# Distributed under terms of the MIT license.
#
# Auto run for collecting numbers

TSTAMP=`date +%Y%m%d_%T | sed 's/:/_/g'`
#OUTPUT="${TSTAMP}/output_${TSTAMP}"
#echo "\$output = $OUTPUT"
OUTPUT_DIR="${TSTAMP}"
echo "\$output_dir = $OUTPUT_DIR"
mkdir ${TSTAMP}


#####
# NEED YOUR ATTENTION!!
#####
#SUFFIX=_aarch64
SUFFIX=_x86-64 
echo -e "NEED YOUR ATTENTION!!\n"
echo -e "Your target arch is $SUFFIX\n\n\n\n"
sleep 5

##
# APPs
##
declare -a arr_npb=("bt${SUFFIX}"  "cg${SUFFIX}"  "dc${SUFFIX}"  "ep${SUFFIX}"  "ft${SUFFIX}"  "is${SUFFIX}"  "lu${SUFFIX}"  "mg${SUFFIX}"  "sp${SUFFIX}"  "ua${SUFFIX}") # all
#declare -a arr_npb=("ep${SUFFIX}"  "cg${SUFFIX}") # test


for app_npb in "${arr_npb[@]}"; do
	echo -e "\nRun $app_npb\n"

	for x in `seq 6`; do
		(time ./${app_npb}) |& tee -a ${OUTPUT_DIR}/full_log_${app_npb}
		# ./${app_npb}
	done
	cat full_log_${app_npb} | grep "Time in seconds" > ${OUTPUT_DIR}/compute_log_${app_npb}
	cat full_log_${app_npb} | grep "real" > ${OUTPUT_DIR}/time_real_log_${app_npb}

	echo -e "\nDone $app_npb\n"
done
