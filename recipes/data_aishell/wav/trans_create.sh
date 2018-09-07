#! /bin/bash

if [ -f trans.txt ]; then
	rm -rf trans.txt
fi
cat ../transcript/aishell_transcript_v0.8.txt | while read line
do
	echo "running..."
	var=`echo $line | awk '{print $1}'`

	if [ ${var:7:4} -lt 724 ]; then
		echo "$var	${line:17:100}" >> trans_train.txt
	fi
	
	if [ ${var:7:4} -ge 764 ]; then
		echo "$var	${line:17:100}" >> trans_test.txt
	fi

	if [ ${var:7:4} -ge 724 ] && [ ${var:7:4} -le 763 ]; then
		echo "$var	${line:17:100}" >> trans_dev.txt
	fi
	
done

for file in "trans_train.txt" "trans_test.txt" "trans_dev.txt"
do
	if [ ${file:6:3} == "tra" ]; then
		echo "train"
		mv trans_train.txt train/trans.txt
	elif [ ${file:6:3} == "tes" ]; then
		echo "test"
		mv trans_test.txt test/trans.txt
	elif [ ${file:6:3} == "dev" ]; then
		echo "dev"	
		mv trans_dev.txt dev/trans.txt
	fi
done
echo "trans.txt create done..."
