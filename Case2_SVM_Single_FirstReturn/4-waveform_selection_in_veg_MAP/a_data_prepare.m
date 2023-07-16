clc
clear
close all
load Return_FL03
load Return_FL12
% [img,RO]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
FirstReturn9=dlmread('piontcloud_FirstReturn_FL03+FL12(9).txt');

Return=[Return_FL03;Return_FL12];


save FirstReturn9 FirstReturn9
save Return Return