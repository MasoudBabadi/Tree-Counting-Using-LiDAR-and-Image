clc
clear
close all
[I,RO]=geotiffread('second_ANN_Classified.tif');
bin0=I(:,:,4);
bin0(bin0>0)=1;
segmentnum=I(:,:,5);
% peaknum=I(:,:,10);
[r,c]=find(bin0==1);
for i=1:nnz(bin0)
    seg(i)=segmentnum(r(i),c(i));
%     Peak(i)=peaknum(r(i),c(i));
end
seg=seg';
   [b,ind]=sort(seg);%  sorting the data

 for i=1:length(b)
       rs=r(ind(i));
       plistsorted(i,1)=rs;% the row of the point
       cs=c(ind(i));
       plistsorted(i,2)=cs;% the column of the point
       plistsorted(i,3)=b(i);  % the segment number
%        PeakS=Peak(ind(i));
%        plistsorted(i,4)=PeakS;  % the peak number
   end
     newplist1=nearst(plistsorted,13);
     bin1=zeros(1000,1000);
     siz=size(newplist1);
     for i=1:siz(1)
         bin1(newplist1(i,1),newplist1(i,2))=1;
     end
     
  third_removenear_13=I.*bin1;
  save third_removenear_13 third_removenear_13
        Geotiffsave_DS(third_removenear_13,RO, 'third_removenear_13')
nnz(bin1)
  