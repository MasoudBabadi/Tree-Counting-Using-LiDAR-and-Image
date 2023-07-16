clc 
clear 
close all
load FirstReturn9 FirstReturn9
[image,RO1]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
[DEM,RO2]=geotiffread('dem_tiff.tif');

PX=FirstReturn9(:,1);
PY=FirstReturn9(:,2);
PZ=FirstReturn9(:,3);

[py,px]=map2pix(RO2,PX,PY);
P=[px,py];

imagesc(DEM); 
hold on
plot(px,py,'.r')

px=round(px);
py=round(py);
px(px>497)=497;
py(py>497)=497;
px(px<=0)=1;
py(py<=0)=1;
pr=[px,py];
figure;imagesc(DEM);
 
hold on
plot(px,py,'.r')
s=size(pr);
for i=1:s(1)
    i
  pDem(i)= DEM(pr(i,2),pr(i,1)) ;
end
NDSM=PZ-pDem';
NDSM_Points(:,1:3)=FirstReturn9(:,1:3);
NDSM_Points(:,4)=NDSM;
NDSM_Points(:,5:10)=FirstReturn9(:,4:9);
save NDSM_Points NDSM_Points
% save('NDSM_Points.txt','NDSM_Points','-ascii')
