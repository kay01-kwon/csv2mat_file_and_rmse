function [] = csv2mat(csv_name,path_of_file,path_to_save)

% Csv data folder directory

csv_dir = strcat(path_of_file,csv_name)
openFile = fopen([csv_dir],'r');

DataStartLine = 8;

for i=1:7
    line=fgetl(openFile);
    lines(i).string=regexp(line, ',', 'split');
end

% parse the general properties
FormatVersion=str2double(lines(1).string(2));
fps=str2double(lines(1).string(8));
date=lines(1).string(10);
TotalFrames=str2double(lines(1).string(14));
filename=csv_dir;

body_names = ["EEF"];
TotalBodies = length(body_names);

R = [0 0 1;
    1 0 0;
    0 1 0];


body_index(1,:)=find(body_names==lines(4).string);
field = body_names(1);
value(:,1:2) = readmatrix([csv_dir],'Range',[DataStartLine, 1, TotalFrames+DataStartLine-1, 2]);
body_index(1,end)-1
TotalFrames
value(:,3:8) = readmatrix([csv_dir],...
        'Range',[DataStartLine, body_index(1,1), TotalFrames+DataStartLine-1, body_index(1,end)-1]);
value(:,6:8) = (R*value(:,6:8)')';
data.body_name = body_names;
data.CSVdata = value;
data.CSVprocessedData=fillmissing(data.CSVdata,'linear');

csv_name = strrep(csv_name,'.csv','.mat');
path_to_save = strcat(path_to_save,csv_name);

save([path_to_save,'.mat'],'data')

clear all;

end

