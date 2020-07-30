function to_folder
% go to the folder that contains the file
 file_full_path = matlab.desktop.editor.getActiveFilename;
 [filepath,name,ext] = fileparts(file_full_path);
 cd(filepath);
end

