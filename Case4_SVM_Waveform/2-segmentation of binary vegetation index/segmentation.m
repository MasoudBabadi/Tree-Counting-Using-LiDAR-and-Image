function yy=segmentation(img,thereshold,connectivity )
global nofps;
siz=size(img);
% connectivity  is 4 or 8
% initializing the segmented image
for i=1:siz(1)
    i
    for j=1:siz(2)
        segmented(i,j)=0;
    end
end
segnum=0;
%  segmenting 

if connectivity ==4
for i=1:siz(1)
    i
    for j=1:siz(2)
        j
           if segmented(i,j)==0
            segnum=segnum+1;%  segment's number
         %   nofps=1;
            segmented(i,j)=segnum;
          segmented= find4conect(img,segmented,i,j,segnum,thereshold);
           % nofparry(segnum)=nofps;            
        end  %      if segmented(i,j)==0
    end% of for j
end % of for i
end% if connectivity== 4


if connectivity ==8
for i=1:siz(1)
    i
    for j=1:siz(2)
        j
           if segmented(i,j)==0
            segnum=segnum+1;   %  segment's number
            segmented(i,j)=segnum;
          segmented= find8conect(img,segmented,i,j,segnum,thereshold);

        end  %    if segmented(i,j)==0
    end% of for j
end % of for i
end% if connectivity== 8

yy=segmented;
