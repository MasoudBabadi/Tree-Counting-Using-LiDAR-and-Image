clc 
clear
close all
[img,RO1]=geotiffread('FeatureMap_Nor.tif');
load First_LocMax
I=First_LocMax(:,:,11);
I(I>0)=1;
   Geotiffsave_DS(I,RO1, 'First_LocMax_Binary')
