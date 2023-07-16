clc
clear
close all
[img,RO]=geotiffread('third_removenear_13.tif');

load('fourh_removeEdge_Points_2.mat')
I=fourh_removeEdge_Points_2(:,:,11);
% nnz(I)
I(I>0)=1;
 Geotiffsave_DS(I,RO, 'Final_Points')
