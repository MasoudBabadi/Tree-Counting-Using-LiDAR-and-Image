clc
clear
close all
[third_removenear,RO]=geotiffread('third_removenear_13.tif');
segment=third_removenear(:,:,12);
bin=third_removenear(:,:,11);
bin(bin>0)=1;
for i=1:10
    BIN(:,:,i)=bin;
end

load ref_veg_MAP2
[r,c]=find(bin==1);

for XL_Num=1:10
    
for i=1:length(r)
    W=matrixcrop(ref_veg_MAP2,r(i),c(i),5,5);

   NNZ=nnz(W);
%    NNZ_Test(i)=NNZ;
   segnum1=W(3,3);
%    segnum2=segment(r(i),c(i));
   p=bin(segment==segnum1);
       s=size(p);
   if NNZ<22 && s(1)>=XL_Num
       BIN(r(i),c(i),XL_Num)=0;
end
end
end
% fourh_removeEdge_Points_2=third_removenear;
% fourh_removeEdge_Points_2=fourh_removeEdge_Points_2.*bin;





GT=imread('GT.tif');
GT=GT(:,:,1);
[Gy,Gx]=find(GT~=0);
s1=unique(ref_veg_MAP2);
% n=0;
% % % peyda kardan tedad derakhtan vageei dar har segment
for i=1:s1(end)
    i
    [y,x]=find(ref_veg_MAP2==i);
seg=[x,y];
s2=size(seg);
s3=size(Gx);
n=0;

for j=1:s2(1)
     for k=1:s3(1)
         if seg(j,1)==Gx(k) & seg(j,2)==Gy(k)
             n=n+1;
             Tree_In_GT(i)=n;
         end
     end
end
end

% % % peyda kardan tedad noghat baghi mande dar har segment
for XL_Num=1:10
    XL_Num
fourh_removeEdge_Points_2=third_removenear.*BIN(:,:,XL_Num);
I_seg=fourh_removeEdge_Points_2(:,:,12);
I_seg=reshape(I_seg,1000000,1);
I_seg(I_seg==0)=[];
for i=1:s1(end)

    Point_Seg=find(I_seg==i);
    NumPoint_Seg(i)=nnz(Point_Seg);
end

fourh_removeEdge_Points_2_excel_Remain=zeros(139,3);
fourh_removeEdge_Points_2_excel_Remain(:,1)=1:s1(end);
fourh_removeEdge_Points_2_excel_Remain(:,2)=NumPoint_Seg;
fourh_removeEdge_Points_2_excel_Remain(:,3)=Tree_In_GT;
fourh_removeEdge_Points_2_excel_Remain(58,3)=1;  %%%in this segment there is a tree
fourh_removeEdge_Points_2_excel_Remain(80,3)=1;  %%%in this segment there is a tree
fourh_removeEdge_Points_2_excel_Remain(47,3)=fourh_removeEdge_Points_2_excel_Remain(47,3)+1;  %%%in this segment there is one more tree
fourh_removeEdge_Points_2_excel_Remain(67,3)=fourh_removeEdge_Points_2_excel_Remain(67,3)+1;  %%%in this segment there is one more tree
fourh_removeEdge_Points_2_excel_Remain(68,3)=fourh_removeEdge_Points_2_excel_Remain(68,3)+2;  %%%in this segment there is two more tree
fourh_removeEdge_Points_2_excel_Remain(105,3)=fourh_removeEdge_Points_2_excel_Remain(105,3)+1;  %%%in this segment there is one more tree
fourh_removeEdge_Points_2_excel_Remain(61,3)=fourh_removeEdge_Points_2_excel_Remain(61,3)+1;  %%%in this segment there is one more tree
fourh_removeEdge_Points_2_excel_Remain(:,4)=fourh_removeEdge_Points_2_excel_Remain(:,2)-fourh_removeEdge_Points_2_excel_Remain(:,3);

I4=fourh_removeEdge_Points_2_excel_Remain(:,4);
I3=fourh_removeEdge_Points_2_excel_Remain(:,3);

negative=find(I4<0);
SumNeg=sum(I4(negative));

positive=find(I4>0);
Sumpos=sum(I4(positive));


Exact_Seg=find(I4==0);
SumeEac=sum(I3(Exact_Seg));

exl(:,XL_Num)=[sum(fourh_removeEdge_Points_2_excel_Remain(:,2));Sumpos;SumNeg;SumeEac];


end
