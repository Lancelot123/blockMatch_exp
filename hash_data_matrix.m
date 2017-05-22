clc;
clear;

path1 = 'D:\\Liu\\result_1000\\mydata';
path2 = 'D:\\Liu\\result_mixclolor_1000\\';

for i =1:1000
    str1 = strcat(path1,int2str(i),'.mat');
    load(str1);
    mix_data = cell_r_ans + cell_g_ans + cell_b_ans;
    mix_data_name = strcat(path2, 'mixdata',int2str(i),'.mat');
    save(mix_data_name, 'mix_data');
end