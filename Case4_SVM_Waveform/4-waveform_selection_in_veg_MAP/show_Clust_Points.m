clc
clear
close all
load FirstReturn9
% load VegPoints

[image,RO1]=geotiffread('2013_SJER_AOP_Camera_sample.tif');

PX=FirstReturn9(:,1);
PY=FirstReturn9(:,2);
% Pn=FirstReturn9(:,10);
[py,px]=map2pix(RO1,PX,PY);
load Point_Add
 figure;
 imagesc(image);
 hold on
 plot(px(Point_Add),py(Point_Add),'.b')
