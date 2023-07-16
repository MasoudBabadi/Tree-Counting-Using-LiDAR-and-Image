% matrix Cliping function for 2d matrices
function y=matrixcrop(m,ic,jc,n1,n2)
% m: is the matrix
% ic,jc are the coordinate of the cennter of the cropping window
% n1 and n2 are the dimentions of the crooping window
siz=size(m);
sr=ic-fix(n1/2);%  strting row
for i=sr:ic
    if i>0
        sr=i;break;
    end
end

sc=jc-fix(n2/2);%  starting col
for i=sc:jc
    if i>0
        sc=i;break;
    end
end

er=ic+fix(n1/2);%  ending row
for i=ic:er
    if i>siz(1)
        er=i-1;break;
    end
end

ec=jc+fix(n2/2);%  ending col
for i=jc:ec
    if i>siz(2)
        ec=i-1;break;
    end
end
clc
% ic,jc
% sr,er,sc,ec
y=m(sr:er,sc:ec);%  the clipped window








