clc
clear
close all
load third_removenear_13
% fifth_F10_max=imread('fifth_F10_max.tif');
third_removenear_13_Data=third_removenear_13;
third_removenear_13_Data(:,:,8)=[];

I=reshape(third_removenear_13_Data,1000000,7);
I1=I(:,4);
[r,c]=find(I1~=0);
third_removenear_13_Data=I(r,:);
xlswrite('third_removenear_13_Excel_Data.xlsx',third_removenear_13_Data)