function file = data_embedding(FileName, PathName, TextFile, Password, OutPath)


% close all; clear all; clc;

audio = audioload(FileName, PathName);

%file = 'text.txt';
%fid  = fopen(file, 'r');
fid  = fopen(TextFile, 'r');
text = fread(fid,'*char')';
fclose(fid);

out = echo_enc_single(audio.data, text);
audiosave(out, audio, OutPath);