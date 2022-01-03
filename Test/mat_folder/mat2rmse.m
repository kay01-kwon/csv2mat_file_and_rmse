clear all
current_directory = pwd;
current_directory = strcat(current_directory,'/');
files_ = dir(fullfile(current_directory,'*.mat'))
files_number = length(files_);

for i = 1:files_number
    load_files = strcat(current_directory,files_(i).name);
    load(load_files)
    X(:,1) = data.CSVprocessedData(:,6);
    Y(:,1) = data.CSVprocessedData(:,7);
    Z(:,1) = data.CSVprocessedData(:,8);
    
    X_avg(i) = sum(X(:,1))/length(X(:,1));
    Y_avg(i) = sum(Y(:,1))/length(Y(:,1));
    Z_avg(i) = sum(Z(:,1))/length(Z(:,1));
    
    X_err(i) = X_avg(i) - X_avg(1);
    Y_err(i) = Y_avg(i) - Y_avg(1);
    Z_err(i) = Z_avg(i) - Z_avg(1);
    
    D_err(i) = sqrt(X_err(i)^2 + Y_err(i)^2 + Z_err(i)^2);
    
    
    clear data
    clear X
    clear Y
    clear Z
    
end

D_rms = rms(D_err)
