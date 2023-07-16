clc
clear
close all
load ref_veg_MAP2
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

load second_ANN_Classified
I_seg=second_ANN_Classified(:,:,12);
I_seg=reshape(I_seg,1000000,1);
I_seg(I_seg==0)=[];
for i=1:s1(end)
i
    Point_Seg=find(I_seg==i);
    NumPoint_Seg(i)=nnz(Point_Seg);
end

second_ANN_Classified_excel_Remain=zeros(139,3);
second_ANN_Classified_excel_Remain(:,1)=1:s1(end);
second_ANN_Classified_excel_Remain(:,2)=NumPoint_Seg;
second_ANN_Classified_excel_Remain(:,3)=Tree_In_GT;
second_ANN_Classified_excel_Remain(58,3)=1;  %%%in this segment there is a tree
second_ANN_Classified_excel_Remain(80,3)=1;  %%%in this segment there is a tree
second_ANN_Classified_excel_Remain(47,3)=second_ANN_Classified_excel_Remain(47,3)+1;  %%%in this segment there is one more tree
second_ANN_Classified_excel_Remain(67,3)=second_ANN_Classified_excel_Remain(67,3)+1;  %%%in this segment there is one more tree
second_ANN_Classified_excel_Remain(68,3)=second_ANN_Classified_excel_Remain(68,3)+2;  %%%in this segment there is two more tree
second_ANN_Classified_excel_Remain(105,3)=second_ANN_Classified_excel_Remain(105,3)+1;  %%%in this segment there is one more tree
second_ANN_Classified_excel_Remain(61,3)=second_ANN_Classified_excel_Remain(61,3)+1;  %%%in this segment there is one more tree
second_ANN_Classified_excel_Remain(:,4)=second_ANN_Classified_excel_Remain(:,2)-second_ANN_Classified_excel_Remain(:,3);

I4=second_ANN_Classified_excel_Remain(:,4);
I3=second_ANN_Classified_excel_Remain(:,3);

sum(second_ANN_Classified_excel_Remain(:,2))
negative=find(I4<0);
size(negative,1)
SumNeg=sum(I4(negative))
positive=find(I4>0);
size(positive,1)
Sumpos=sum(I4(positive))
Exact_Seg=find(I4==0);
size(Exact_Seg,1)
SumeEac=sum(I3(Exact_Seg))

xlswrite('second_ANN_Classified_excel_Remain.xlsx',second_ANN_Classified_excel_Remain)
% 
