clc
clear
close all
load second_SVM_Classified
% fifth_F10_max=imread('fifth_F10_max.tif');
second_SVM_Classified_Data=second_SVM_Classified;
second_SVM_Classified_Data(:,:,15)=[];

I=reshape(second_SVM_Classified_Data,1000000,14);
I1=I(:,11);
[r,c]=find(I1~=0);
second_SVM_Classified_Data=I(r,:);
xlswrite('second_SVM_Classified_Excel_Data.xlsx',second_SVM_Classified_Data)