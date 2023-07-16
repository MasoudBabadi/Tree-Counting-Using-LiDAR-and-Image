clc
clear
close all
load clus_Return
load VegPoints
load ref_veg_MAP

ref_veg_MAP2=ref_veg_MAP;
s=size(VegPoints);
f=VegPoints(:,10);
VegPoints2=VegPoints;
VegPoints2(:,11)= clus_Return(f,251);
Tree_Returns=clus_Return(f,1:250);



 r=find(VegPoints2(:,4)<1);
VegPoints2(r,:)=[];
Tree_Returns(r,:)=[];



a=VegPoints2(:,11);
uni=unique(a);
ref_veg_MAP2(ref_veg_MAP2==47)=0;
ss=size(uni);
for i=1:ss(1)
    if uni(i)~=i
        a(a==uni(i))=i;
        ref_veg_MAP2(ref_veg_MAP2==uni(i))=i;
    end
end
VegPoints2(:,11)=a;
save ref_veg_MAP2 ref_veg_MAP2
save Tree_Returns Tree_Returns
save VegPoints2 VegPoints2
% save('VegPoints2.txt','VegPoints2','-ascii')
