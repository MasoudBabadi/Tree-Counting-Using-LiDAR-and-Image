clc
clear
close all
[third_removenear,RO]=geotiffread('third_removenear_13.tif');
segment=third_removenear(:,:,12);
bin=third_removenear(:,:,11);
bin(bin>0)=1;
load ref_veg_MAP2
[r,c]=find(bin==1);

for i=1:length(r)
    W=matrixcrop(ref_veg_MAP2,r(i),c(i),5,5);

   NNZ=nnz(W);
%    NNZ_Test(i)=NNZ;
   segnum1=W(3,3);
%    segnum2=segment(r(i),c(i));
   p=bin(segment==segnum1);
       s=size(p);
   if NNZ<22 && s(1)>=2
       bin(r(i),c(i))=0;
end
end
fourh_removeEdge_Points_2=third_removenear;
fourh_removeEdge_Points_2=fourh_removeEdge_Points_2.*bin;
save fourh_removeEdge_Points_2 fourh_removeEdge_Points_2
 Geotiffsave_DS(fourh_removeEdge_Points_2,RO, 'fourh_removeEdge_Points_2')

nnz(bin)
    