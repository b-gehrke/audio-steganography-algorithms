function file = data_embedding(FileName, PathName, TextFile, Password, OutPath)

% close all; clear all; clc;

% audio = audioload(FileName, PathName);
audio = audioload(FileName, PathName);

fid  = fopen(TextFile, 'r');
text = fread(fid,'*char')';
fclose(fid);

out = iss_enc(audio.data, text, Password);
audiosave(out, audio, OutPath, '.mp3', 128);
