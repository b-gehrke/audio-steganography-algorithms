#!/bin/bash
if [ -z $1 ] || [ -z $2 ]; then
	echo "Usage: $0 <textfile> <password> <outpath> <audio-in-path ...>"
	exit 1
fi

textfile=$1
password=$2
outpath=$3
infiles=${@:4}


for f in $infiles; do
	file=$(basename "$f")
	filepath=$(realpath $(dirname "$f"))

	var="{'$file';'$filepath/'}"
	vars=`[ -z "$vars" ] && echo "$var" || echo "$vars $var"`
done;
vars="[$vars]"

program="input = $vars; for v = input; data_embedding(v{1}, v{2}, '$textfile', '$password', '$outpath'); end; exit";
echo "Executing MatLab Progam:\n\n$program\n\n"

matlab -nodisplay -r "$program"
# Octave appears not to be able to run .p files
# octave --eval "$program" -p $(pwd)
