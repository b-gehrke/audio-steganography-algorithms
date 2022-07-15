set -e

#mv ~/Downloads/mcv-test/stego ~/Downloads/mcv-test/01-Improved-Spread-Spectrum
#mkdir ~/Downloads/mcv-test/stego/

#cd ~/development/audio-steganography-algorithms/02-Echo-Hiding/01-Echo-Hiding-Single-Kernel/

#find ~/Downloads/mcv-test/cover/female -name "*.mp3" | tr '\n' ' ' | xargs -n 250 ../../embed.sh text.txt asd /home/bjoern/Downloads/mcv-test/stego/female
#mv ~/development/audio-steganography-algorithms/02-Echo-Hiding/01-Echo-Hiding-Single-Kernel/audio_out ~/Downloads/mcv-test/stego/female

#find ~/Downloads/mcv-test/cover/male -name "*.mp3" | tr '\n' ' ' | xargs -n 250 ../../embed.sh text.txt asd /home/bjoern/Downloads/mcv-test/stego/male
#mv ~/development/audio-steganography-algorithms/02-Echo-Hiding/01-Echo-Hiding-Single-Kernel/audio_out ~/Downloads/mcv-test/stego/male

#find ~/Downloads/mcv-test/cover/other -name "*.mp3" | tr '\n' ' ' | xargs -n 250 ../../embed.sh text.txt asd /home/bjoern/Downloads/mcv-test/stego/other
#mv ~/development/audio-steganography-algorithms/02-Echo-Hiding/01-Echo-Hiding-Single-Kernel/audio_out ~/Downloads/mcv-test/02-Echo-Hiding-Single-Kernel/other

#mv ~/Downloads/mcv-test/stego/ ~/Downloads/mcv-test/02-Echo-Hiding-Single-Kernel

cd ~/Downloads/mcv-test/

until rsync -avh . gpu:/project/datasets/MCV/testing
do
sleep .1
done
