clc
clear
close all
load second_SVM_Classified
% fifth_F10_max=imread('fifth_F10_max.tif');
second_SVM_Classified=second_SVM_Classified;
second_SVM_Classified(:,:,8)=[];

I=reshape(second_SVM_Classified,1000000,7);
I1=I(:,4);
[r,c]=find(I1~=0);
second_SVM_Classified=I(r,:);
xlswrite('second_SVM_Classified_Excel_Data.xlsx',second_SVM_Classified)