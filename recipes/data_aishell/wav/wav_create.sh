#! /bin/bash

for file in "dev/trans.txt" "test/trans.txt" "train/trans.txt"
do
	cat $file | while read line
	do
		l1=`echo $line | awk '{print $1}'`
		echo ${l1}
		echo "${l1}	wav/${l1:6:5}/${l1}.wav" >> wav.scp

	done

	if [ ${file:0:3} == "dev" ]; then
		mv wav.scp dev/wav.scp 
		echo "dev wav scp created!"
	elif [ ${file:0:3} == "tes" ]; then
		mv wav.scp test/wav.scp 
		echo "test wav scp created!"
	elif [ ${file:0:3} == "tra" ]; then
		mv wav.scp train/wav.scp 
		echo "train wav scp created!"
	fi
done
