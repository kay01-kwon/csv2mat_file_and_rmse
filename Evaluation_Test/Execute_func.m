function [] = Execute_func(csv_data_folder,mat_folder)

current_path_dir = pwd;
current_path_dir = strcat(current_path_dir,'/');

% CSV folder directory
path_of_csv_file = strcat(current_path_dir,csv_data_folder);
path_of_csv_file = strcat(path_of_csv_file,'/');

path_of_mat_folder = strcat(current_path_dir,mat_folder);
path_of_mat_folder = strcat(path_of_mat_folder,'/');

csv_file_ = dir(fullfile(path_of_csv_file,'*.csv'));

csv_file_num = length(csv_file_);

for i =1:csv_file_num
    csv_file_(i).name
    csv2mat(csv_file_(i).name,path_of_csv_file,path_of_mat_folder);
end