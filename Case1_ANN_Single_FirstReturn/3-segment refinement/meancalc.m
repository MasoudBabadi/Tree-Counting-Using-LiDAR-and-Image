function y=meancalc(final,img)
%this function calculates mean value for segments
% img   original image ; the source of means
%  class number of clsses or segments ;     final : outpout segmented matrix
siz=size(img);
if length(siz)==2
    tt=1;
else
    tt=siz(3);
end
class=max(max(final));
mv=zeros(class,tt);
n=zeros(class,1);

for i=1:siz(1)%  number of rows
    for j=1:siz(2)%  number of cols
        if final(i,j)~=0
          no=n(final(i,j));    
         for b=1:tt    %  number of bands
          mo=mv(final(i,j),b);
          mv(final(i,j),b)=( (mo*no) + double(img(i,j,b)) )/(no+1);
         end % of b
         n(final(i,j)) =no+1;
       end % of if final(i,j)~=0

    end% of j
end
y=[mv n];
