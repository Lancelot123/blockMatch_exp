% clc;
% clear;
% 
% path1 = 'D:\Liu\train\';
% path2 = 'D:\\Liu\\result\\';
% M = 10000;
% for i = 1:M
%     for j = 1:M
%         str1 = strcat(path1,int2str(i),'.png');
%         str2 = strcat(path1,int2str(j),'.png');
%         a = imread(str1);
%         b = imread(str2);
%         a = double(a);
%         b = double(b);
%         opt.Retain = 32;
%         cell_r = blockMatch(a(:,:,1),b(:,:,1),[8,8],opt);
%         cell_g = blockMatch(a(:,:,2),b(:,:,2),[8,8],opt);
%         cell_b = blockMatch(a(:,:,3),b(:,:,3),[8,8],opt);
%         mydata_name = strcat(path2,'mydata',int2str(i),'_',int2str(j),'.mat');
%         save(mydata_name,'cell_r','cell_g','cell_b');
%         clear cell_r cell_g cell_b;
%     end
% end


clc;
clear;

path1 = 'D:\Liu\train\';
path2 = 'D:\\Liu\\result_2\\';
path3 = 'D:\\Liu\\result_1000\\';
%M is the number of training pic
M = 10000;
for i = 528:M
    cell_r_ans = zeros(6,M);
    cell_g_ans = zeros(6,M);
    cell_b_ans = zeros(6,M);
        
    for j = 1:M
        str1 = strcat(path1,int2str(i),'.png');
        str2 = strcat(path1,int2str(j),'.png');
        a = imread(str1);
        b = imread(str2);
        a = double(a);
        b = double(b);
        opt.Retain = 32;
        
        
        %to the channel red
        cell_r = blockMatch(a(:,:,1),b(:,:,1),[8,8],opt);
        sh1  = 0;
        sh2  = 0;
        sh4  = 0;
        sh8  = 0;
        sh16 = 0;
        sh32 = 0;  
        for row = 1:25
            for col = 1:25
                sh1  = sh1  + cell_r{row, col}(1,3);
                sh2  = sh2  + cell_r{row, col}(2,3);
                sh4  = sh4  + cell_r{row, col}(4,3);
                sh8  = sh8  + cell_r{row, col}(8,3);
                sh16 = sh16 + cell_r{row, col}(16,3);
                sh32 = sh32 + cell_r{row, col}(32,3);  
            end
        end 
        cell_r_ans(1,j) = sh1;
        cell_r_ans(2,j) = sh2;
        cell_r_ans(3,j) = sh4;
        cell_r_ans(4,j) = sh8;
        cell_r_ans(5,j) = sh16;
        cell_r_ans(6,j) = sh32;
        
        %to the channel green
        cell_g = blockMatch(a(:,:,2),b(:,:,2),[8,8],opt);
        sh1  = 0;
        sh2  = 0;
        sh4  = 0;
        sh8  = 0;
        sh16 = 0;
        sh32 = 0;  
        for row = 1:25
            for col = 1:25
                sh1  = sh1  + cell_g{row, col}(1,3);
                sh2  = sh2  + cell_g{row, col}(2,3);
                sh4  = sh4  + cell_g{row, col}(4,3);
                sh8  = sh8  + cell_g{row, col}(8,3);
                sh16 = sh16 + cell_g{row, col}(16,3);
                sh32 = sh32 + cell_g{row, col}(32,3);  
            end
        end 
        cell_g_ans(1,j) = sh1;
        cell_g_ans(2,j) = sh2;
        cell_g_ans(3,j) = sh4;
        cell_g_ans(4,j) = sh8;
        cell_g_ans(5,j) = sh16;
        cell_g_ans(6,j) = sh32;
        
        %to the channel blue
        cell_b = blockMatch(a(:,:,3),b(:,:,3),[8,8],opt);
        sh1  = 0;
        sh2  = 0;
        sh4  = 0;
        sh8  = 0;
        sh16 = 0;
        sh32 = 0;  
        for row = 1:25
            for col = 1:25
                sh1  = sh1  + cell_b{row, col}(1,3);
                sh2  = sh2  + cell_b{row, col}(2,3);
                sh4  = sh4  + cell_b{row, col}(4,3);
                sh8  = sh8  + cell_b{row, col}(8,3);
                sh16 = sh16 + cell_b{row, col}(16,3);
                sh32 = sh32 + cell_b{row, col}(32,3);  
            end
        end 
        cell_b_ans(1,j) = sh1;
        cell_b_ans(2,j) = sh2;
        cell_b_ans(3,j) = sh4;
        cell_b_ans(4,j) = sh8;
        cell_b_ans(5,j) = sh16;
        cell_b_ans(6,j) = sh32;
        
%         mydata_name = strcat(path2,'mydata',int2str(i),'_',int2str(j),'.mat');
%         save(mydata_name,'cell_r','cell_g','cell_b');
%         clear cell_r cell_g cell_b;
    end
    mydata_name = strcat(path2,'mydata',int2str(i),'.mat');
    save(mydata_name,'cell_r_ans','cell_g_ans','cell_b_ans');
    
end















