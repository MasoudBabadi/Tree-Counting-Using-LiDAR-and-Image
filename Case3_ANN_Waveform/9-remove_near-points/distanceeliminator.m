function out=distanceeliminator(tlist,t)
siz=size(tlist);  % the points that are belong to one segment
if siz(1)==1
% if siz(1)<3

    out=tlist;
else
distm=zeros(siz(1));
for i=1: siz(1)
    for j=1:siz(1)
        dx=tlist(i,1)-tlist(j,1);        dy=tlist(i,2)-tlist(j,2);
        d=sqrt(dx^2+dy^2);
        if d>t
        distm(i,j)=d;
        end
    end
end
for i=1:siz(1)-1
    for j=i+1:siz(1)
        if distm(i,j)==0
            tlist(j,3)=0;
        end
    end
end
s=0;
for i=1: siz(1)
    if  tlist(i,3)~=0
        s=s+1;
        out(s,1)=tlist(i,1); out(s,2)=tlist(i,2); out(s,3)=tlist(i,3);
    end
end

end% of if








