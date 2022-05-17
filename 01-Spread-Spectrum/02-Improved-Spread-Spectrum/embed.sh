#!/bin/sh
if [ -z $1 ]; then
	echo "Usage: $0 <audio-in-path ...>"
	exit 1
fi

file=$(basename "$1")
filepath=$(realpath $(dirname "$1"))

for f in $@; do
	file=$(basename "$f")
	filepath=$(realpath $(dirname "$f"))

	var="('$file' : '$filepath/')"
	vars=`[ -z "$vars" ] && echo "$var" || echo "$vars:$var"`
done;


matlab -nodisplay -r "input = $vars; for (file : path) = input; data_embedding(file, path); end; exit"
#octave --eval "data_embedding('$file', '$filepath/'); exit" -p $(pwd)
