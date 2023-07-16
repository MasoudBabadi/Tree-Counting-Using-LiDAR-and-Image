function y=seg_pixnumbercalc(final)
%this function calculates number of pixels for segments
%     vrc : outpout vector
% final segmented image
siz=size(final);
class=max(max(final));
n=zeros(class,1);

for i=1:siz(1)%  number of rows
    for j=1:siz(2)%  number of cols
          t=final(i,j);
          if t~=0
          n(t)=n(t)+1;
          end
       end % of if final(i,j)~=0

    end% of j

y= n;
