
clc
clear
close all
load featuretable_JustSmooth
% feature=featuretable_OneScale;
feature=(featuretable_JustSmooth-min(featuretable_JustSmooth))./(max(featuretable_JustSmooth)-min(featuretable_JustSmooth));
load VegPoints2
feature(:,12)=VegPoints2(:,11);  %%%this is number of segments

[image,RO1]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
FeatureMAP=zeros(1000,1000,12);

PX=VegPoints2(:,1);
PY=VegPoints2(:,2);

[py,px]=map2pix(RO1,PX,PY);
pr=[round(px),round(py)];

% imagesc(image);
% hold on
% plot(px,py,'.r')


    
n=0;
ss=size(pr);
 for i=1:ss(1)
     i
     if FeatureMAP(pr(i,2),pr(i,1),1)==0
    FeatureMAP(pr(i,2),pr(i,1),:)=feature(i,:);
     elseif FeatureMAP(pr(i,2),pr(i,1),1)~=0 && feature(i,11)>FeatureMAP(pr(i,2),pr(i,1),11)
         FeatureMAP(pr(i,2),pr(i,1),:)=feature(i,:);
     else   %%%%FeatureMAP(pr(i,2),pr(i,1),1)~=0 && feature(i,11)<FeatureMAP(pr(i,2),pr(i,1),11)
         i
      n=n+1 
     end
 end

FeatureMap_Nor=FeatureMAP;
save FeatureMap_Nor FeatureMap_Nor
Geotiffsave_DS(FeatureMap_Nor,RO1, 'FeatureMap_Nor')