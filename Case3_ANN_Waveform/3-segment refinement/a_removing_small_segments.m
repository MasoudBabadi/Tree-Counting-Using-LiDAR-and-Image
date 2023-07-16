clc
clear
close all
[I,RO]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
bin_map=imread('sixth_ROI_Clustering_SV.tif');
load veg_MAP
ref_veg_MAP=veg_MAP;
% imagesc(ref_veg_MAP)
% in this line, number of pixels of each segment and their values in
% bin_map is calcuted.
Num_Mean=meancalc(ref_veg_MAP,bin_map);

N=find(Num_Mean(:,2)<=70);
s=size(N);

% this loop removes segements that are smaller than 70 pixs
for i=1:s(1)
    ref_veg_MAP(ref_veg_MAP==N(i))=0;
end
% figure;imagesc(ref_veg_MAP)

% this loop removes segements that thair value in binary map is zero
M=find(Num_Mean(:,1)==0);
s=size(M);
for i=1:s(1)
    ref_veg_MAP(ref_veg_MAP==M(i))=0;
end
figure;imagesc(ref_veg_MAP)

% % % dar in ghesmat bekhatere segment haye hazf shode shomareye segment ha moratab mishavand 
uni=unique(ref_veg_MAP);
ss=size(uni);
for i=2:ss(1)
    if uni(i)~=i-1
       
        ref_veg_MAP(ref_veg_MAP==uni(i))=i-1;
    end
end

save ref_veg_MAP ref_veg_MAP
Geotiffsave_DS(ref_veg_MAP,RO, 'ref_veg_MAP')
% figure;imagesc(ref_veg_MAP)
