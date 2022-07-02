close all; clear all; clc;

% audio = audioload("liberty.mp3", "/home/bjoern/study/MediaSec/digitalhistory-stego/");
audio = audioload();

file = 'text.txt';
fid  = fopen(file, 'r');
text = fread(fid,'*char')';
fclose(fid);

msg = iss_dec(audio.data, 8*length(text));
err = BER(text,msg);
nc  = NC(text, msg);

fprintf('Text: %s\n', msg);
fprintf('BER : %d\n', err);
fprintf('NC  : %d\n', nc);