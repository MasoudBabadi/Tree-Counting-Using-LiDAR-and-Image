clc 
clear 
close all
[img,RO1]=geotiffread('FeatureMap_Nor.tif');

    
 I=img(:,:,4);
 
 y1_7=localmax(I,7,7);
 y2_7=localmax(y1_7,7,7);

First_LocMax=img.*y2_7;
 save First_LocMax First_LocMax
   Geotiffsave_DS(First_LocMax,RO1, 'First_LocMax')
