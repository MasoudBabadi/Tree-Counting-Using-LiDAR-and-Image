clc 
clear
close all
[I,RO]=geotiffread('fourh_removeEdge_Points.tif');
GT=imread('GT.tif');
load ref_veg_MAP2
load fourh_removeEdge_Points_2
load fourh_removeEdge_Points_3
bin2=fourh_removeEdge_Points_2(:,:,11);
bin3=fourh_removeEdge_Points_3(:,:,11);
bin2(bin2>0)=1;
bin3(bin3>0)=1;
MAP2=zeros(1000,1000,3);
MAP3=zeros(1000,1000,3);

MAP2(:,:,1)=GT(:,:,1);
MAP2(:,:,2)=bin2;
MAP3(:,:,1)=GT(:,:,1);
MAP3(:,:,2)=bin3;

 Geotiffsave_DS(MAP2,RO, 'MAP2')
 Geotiffsave_DS(MAP3,RO, 'MAP3')
 Geotiffsave_DS(ref_veg_MAP2,RO, 'ref_veg_MAP2')

 