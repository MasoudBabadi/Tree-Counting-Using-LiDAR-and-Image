function y=find4conect(img,segmented,r,c,segnum,thereshold)
% this func finds the 4 neighbour of the pixel, label them and saves the
% coordinates of them 
%  and calculates the area of the segments
% i , j are the coordinate of the considered pixel
%global area;
i=r;j=c;
%global segmented ;% pilist is the coordinate list of the negibours
 pilist=[];
siz=size(img);
%segmented(i,j)=segnum;  % assigning label to the center pixel

while  1
    %  considering the neighbours
    if i-1>0   
    if (abs( img(i,j)-img(i-1,j) )<=thereshold ) & (segmented(i-1,j)==0 ) 
        segmented(i-1,j)=segnum; %area(segnum)=area(segnum)+1;
        [a,b]=size(pilist);
        pilist(a+1,1)=i-1;pilist(a+1,2)=j;%     adding(i-1,j)
    end
    end% if (i-1>0)
    
    if  i+1<siz(1)+1
    if (abs( img(i,j)-img(i+1,j) )<=thereshold ) & (segmented(i+1,j)==0 ) 
        segmented(i+1,j)=segnum;%area(segnum)=area(segnum)+1;
        [a,b]=size(pilist);
        pilist(a+1,1)=i+1;pilist(a+1,2)=j;%        adding(i+1,j)
    end
    end %if  j-1>0
    
    if   j-1>0
    if (abs( img(i,j)-img(i,j-1) )<=thereshold )  & (segmented(i,j-1)==0 ) 
        segmented(i,j-1)=segnum;%area(segnum)=area(segnum)+1;
        [a,b]=size(pilist);
        pilist(a+1,1)=i;pilist(a+1,2)=j-1;% adding(i,j-1)
    end
    end % if  i+1<siz(1)
    
    if   j+1<siz(2)+1
    if (abs( img(i,j)-img(i,j+1) )<=thereshold ) & (segmented(i,j+1)==0 ) 
        segmented(i,j+1)=segnum;%area(segnum)=area(segnum)+1;
        [a,b]=size(pilist);
        pilist(a+1,1)=i;pilist(a+1,2)=j+1;% dding(i,j+1);
    end
    end % if  j+1<siz(2)
    
    % checking the list of coordinates
     [a,b]=size(pilist);
     if a==0
         y=segmented;
         break;
     end
       i=pilist(a,1);    j=pilist(a,2);
         % eliminating the last coordinate
       pilist=pilist(1:a-1,:);
    end % 
      end % of while





