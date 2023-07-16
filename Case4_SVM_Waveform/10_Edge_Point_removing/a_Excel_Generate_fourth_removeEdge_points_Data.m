clc
clear
close all
load fourh_removeEdge_Points_2
% fifth_F10_max=imread('fifth_F10_max.tif');
fourh_removeEdge_Points_2_Data=fourh_removeEdge_Points_2;
fourh_removeEdge_Points_2_Data(:,:,15)=[];

I=reshape(fourh_removeEdge_Points_2_Data,1000000,14);
I1=I(:,11);
[r,c]=find(I1~=0);
fourh_removeEdge_Points_2_Data=I(r,:);
xlswrite('10_fourh_removeEdge_Points_2_Data_2.xlsx',fourh_removeEdge_Points_2_Data)