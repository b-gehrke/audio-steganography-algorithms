function file = data_embedding(FileName, PathName, Text, Password, OutPath)

% close all; clear all; clc;

audio = audioload(FileName, PathName);

out = dsss_enc(audio.data, Text, Password);
audiosave(out, audio, '.mp3', 128);