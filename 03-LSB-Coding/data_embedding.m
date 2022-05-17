function file = data_embedding(FileName, PathName, Text, Password, OutPath)

% [FileName,PathName] = uigetfile({'.wav'}, 'Select cover audio:');
[file.path,file.name,file.ext] = fileparts([PathName FileName]);

wavin = [PathName FileName];
wavout = [OutPath '/' file.name file.ext];


lsb_enc(wavin, wavout, Text, Password);