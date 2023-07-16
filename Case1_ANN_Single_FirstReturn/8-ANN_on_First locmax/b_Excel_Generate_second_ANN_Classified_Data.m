clc
clear
close all
load second_ANN_Classified
% fifth_F10_max=imread('fifth_F10_max.tif');
second_ANN_Classified_Data=second_ANN_Classified;
second_ANN_Classified_Data(:,:,8)=[];

I=reshape(second_ANN_Classified_Data,1000000,7);
I1=I(:,4);
[r,c]=find(I1~=0);
second_ANN_Classified_Data=I(r,:);
xlswrite('second_ANN_Classified_Excel_Data.xlsx',second_ANN_Classified_Data)