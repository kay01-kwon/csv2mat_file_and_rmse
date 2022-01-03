clear all

file_name = 'Take_001';
openFile = fopen([file_name '.csv'],'r');

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
filename=file_name;

body_names = ["EEF"];
TotalBodies = length(body_names);

R = [0 0 1;
    1 0 0;
    0 1 0];

    body_index(1,:)=find(body_names(1)==lines(4).string);
    field = body_names(1);
    value(:,1:2) = readmatrix([file_name '.csv'],'Range',[DataStartLine, 1, TotalFrames+DataStartLine, 2]);
    value(:,3:9) = readmatrix([file_name '.csv'],...
        'Range',[DataStartLine, body_index(1,i), DataStartLine, body_index(1,end)]);
    value(:,6:8) = (1000*R*value(:,6:8)')';
    data.CSVdata = value;
    data.CSVprocessedData=fillmissing(data.CSVdata,'linear');

%%
close all
figure(1)
plot(data.CSVprocessedData(:,2),data.CSVprocessedData(:,7))
hold on;
plot(data.CSVprocessedData(:,2),data.CSVprocessedData(:,8))
legend('x','y')
% fprintf('CSV Data stored \n');
save([file_name,'.mat'],'data')