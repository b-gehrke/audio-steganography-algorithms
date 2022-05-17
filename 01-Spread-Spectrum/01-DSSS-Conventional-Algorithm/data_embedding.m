function file = data_embedding(FileName, PathName)

% close all; clear all; clc;

audio = audioload(FileName, PathName);

file = 'text.txt';
fid  = fopen(file, 'r');
text = fread(fid,'*char')';
fclose(fid);

out = dsss_enc(audio.data, text);
audiosave(out, audio, '.mp3', 128);