function  out=nearst(plist,t)
% this function calculates the distance between the points in a segment
% plist is the sorted list of points and their segments
sn=plist(1,3);  % the first seg number
tlist(1,1)=plist(1,1);tlist(1,2)=plist(1,2);tlist(1,3)=plist(1,3);
i=1;nop=0;
siz=size(plist);
s=1;
while  i<siz(1)
    i=i+1;
     if plist(i,3)==sn
                  s=s+1;
                  tlist(s,1)=plist(i,1);tlist(s,2)=plist(i,2);tlist(s,3)=plist(i,3);
     else
         out1=distanceeliminator(tlist,t) ; % eliminating the redandant points
         so=size(out1);
         nplist(nop+1:so(1)+nop,:)=out1;
        [ nop alk]=size(nplist);
         s=1;sn=plist(i,3);
         clear tlist
        tlist(1,1)=plist(i,1);tlist(1,2)=plist(i,2);tlist(1,3)=plist(i,3); 
     end
        
end
out=nplist;





