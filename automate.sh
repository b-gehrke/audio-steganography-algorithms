#!/bin/bash
set -e

BASE_DIR=/media/bjoern/Backup/dataset/
TRAIN_DIR=$BASE_DIR/mcv-train
TEST_DIR=$BASE_DIR/mcv-test

for OUT_DIR in $TRAIN_DIR $TEST_DIR; do
echo "[SET] $OUT_DIR"


for ALGO in 01-Improved-Spread-Spectrum 02-Echo-Hiding-Single-Kernel; do
DIR=~/development/audio-steganography-algorithms/$ALGO

cd $DIR

for CAT in female male other; do

if [[ -d $OUT_DIR/$ALGO/$CAT ]]; then
	echo "[SKIPPED] Algo: $ALGO Category: $CAT"
else
	echo "[UPDATE] Algo: $ALGO Category: $CAT"

	rm -rf $DIR/audio_out
	mkdir -p $DIR/audio_out
	mkdir -p $OUT_DIR/$ALGO
	find $OUT_DIR/cover/$CAT -name "*.wav" | ../../embed.sh text.txt asd $DIR/audio_out/
	mv $DIR/audio_out $OUT_DIR/$ALGO/$CAT

fi;

done;
done;
done;


cd ~/development/tf_audio_steganalysis/data_processing/python_scripts/

for OUT_DIR in $TRAIN_DIR $TEST_DIR; do
echo "[SET] $OUT_DIR"

for ALGO in 01-Improved-Spread-Spectrum 02-Echo-Hiding-Single-Kernel 03-LSB-Coding 04-Phase-Coding; do

for CAT in female male other; do
	echo "[QMDCT] Algo: $ALGO Category: $CAT"

	python3 QMDCT_extraction.py $OUT_DIR > /dev/null
done;
done;
done;

#find ~/Downloads/mcv-test/cover/male -name "*.mp3" | tr '\n' ' ' | xargs -n 250 ../../embed.sh text.txt asd /home/bjoern/Downloads/mcv-test/stego/male
#mv ~/development/audio-steganography-algorithms/02-Echo-Hiding/01-Echo-Hiding-Single-Kernel/audio_out ~/Downloads/mcv-test/stego/male

#find ~/Downloads/mcv-test/cover/other -name "*.mp3" | tr '\n' ' ' | xargs -n 250 ../../embed.sh text.txt asd /home/bjoern/Downloads/mcv-test/stego/other
#mv ~/development/audio-steganography-algorithms/02-Echo-Hiding/01-Echo-Hiding-Single-Kernel/audio_out ~/Downloads/mcv-test/02-Echo-Hiding-Single-Kernel/other

#mv ~/Downloads/mcv-test/stego/ ~/Downloads/mcv-test/02-Echo-Hiding-Single-Kernel

#cd ~/Downloads/mcv-test/

cd $TRAIN_DIR
until rsync -avh . gpu:/project/datasets/MCV/training; do sleep .1; done;
cd $TEST_DIR
until rsync -avh . gpu:/project/datasets/MCV/testing; do sleep .1; done;
done;

