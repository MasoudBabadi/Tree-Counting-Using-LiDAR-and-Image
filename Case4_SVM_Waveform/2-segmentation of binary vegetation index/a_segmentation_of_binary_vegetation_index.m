clc
clear 
close all
[I,RO]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
ind=imread('sixth_ROI_Clustering_SV.tif');
ind=im2double(ind);

yy4=segmentation(ind,0,4);
% save yy4 yy4
yy4(yy4==1)=0;    %%%%marbot be back ground ast.

veg_MAP=yy4;
save veg_MAP veg_MAP
Geotiffsave_DS(veg_MAP,RO, 'veg_MAP')
