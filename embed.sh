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

	var="{'$file';'$filepath/'}"
	vars=`[ -z "$vars" ] && echo "$var" || echo "$vars $var"`
done;
vars="[$vars]"

program="input = $vars; for v = input; data_embedding(v{1}, v{2}); end; exit";
echo "Executing MatLab Progam:\n\n$program\n\n"

# matlab -nodisplay -r "$program"
octave --eval "$program" -p $(pwd)
