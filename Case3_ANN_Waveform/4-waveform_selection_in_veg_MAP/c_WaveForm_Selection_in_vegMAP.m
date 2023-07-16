clc
clear
close all
% load FirstReturn9
load NDSM_Points
load Return
load ref_veg_MAP
[image,RO1]=geotiffread('2013_SJER_AOP_Camera_sample.tif');

PX=NDSM_Points(:,1);
PY=NDSM_Points(:,2);
Pn=NDSM_Points(:,10);

[py,px]=map2pix(RO1,PX,PY);
P=[px,py];
pr=[round(px),round(py)];
imshow(image);
figure
imagesc(ref_veg_MAP);
% 
hold on
plot(px,py,'.r')
% % % % % % %
s1=unique(ref_veg_MAP);
clus_Return=Return;
n=0;
for i=1:s1(end)
    i
    
[y,x]=find(ref_veg_MAP==i);
seg=[x,y];

s2=size(seg);
s3=size(pr);
 for j=1:s2(1)
     for k=1:s3(1)
         if seg(j,1)==pr(k,1) & seg(j,2)==pr(k,2)
             n=n+1;
             g(n)=k;
             clus_Return(k,251)=i;
         end
     end
 end
end
save clus_Return clus_Return_A
Point_Add=g;
save Point_Add Pointdd
a=Point_Add;
a=a';
VegPoints=NDSM_Points(a,:);
save VegPoints VegPoints
% save('VegPoints.txt','VegPoints','-ascii')

%  imagesc(veg_MAP);
 figure;
 imshow(image);
 hold on
 plot(px(g),py(g),'.b')



% % % % % % % % % % % % % % % % % % % % % % % % % % % % %

