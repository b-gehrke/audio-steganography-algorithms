#!/bin/bash
if [ -z $1 ] || [ -z $2 ]; then
	echo "Usage: $0 <textfile> <password> <outpath>"
	exit 1
fi

textfile=$1
password=$2
outpath=$3
# infiles=${@:4}

prgm="tmp_embed"

rm -f "$prgm.m"
echo "function file = $prgm()" > "$prgm.m"

echo -n "input = [" >> "$prgm.m"
while read f; do
	file=$(basename "$f")
	filepath=$(realpath $(dirname "$f"))

	var="{'$file';'$filepath/'}"
	echo -n "$var " >> "$prgm.m"
	# vars=`[ -z "$vars" ] && echo "$var" || echo "$vars $var"`
done;

echo "]" >> "$prgm.m"
#vars="[$vars]"

echo "for v = input;
	fprintf('embeding in file name: %s, file path: %s\n', v{1}, v{2});
	try
		data_embedding(v{1}, v{2}, '$textfile', '$password', '$outpath');
	catch ME
		fprintf(2, 'Error while embedding in %s/%s: %s', v{2}, v{1}, getReport(ME))
	end;
	end;
	exit" >> $prgm.m


#program="function file = tmp_embed()
#input = $vars; for v = input; fprintf('embeding in file name: %s, file path: %s\n', v{1}, v{2}); data_embedding(v{1}, v{2}, '$textfile', '$password', '$outpath'); end; exit";

echo "Executing MatLab Progam..."

#$program

#"

#echo "$program" > tmp_embed.m
matlab -nodisplay -r "$prgm" > "$(date +'%Y-%m-%dT%H-%M-%S').log" && rm tmp_embed.m
# Octave appears not to be able to run .p files
# octave --eval "$program" -p $(pwd)
