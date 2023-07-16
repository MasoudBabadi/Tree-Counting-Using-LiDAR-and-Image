function y=localmax(img,n1,n2)
% this function applies the local max operator with siz1 * size2 on an image 
% img:  the image which must be filtered
siz=size(img);
%n1=5;n2=5;
if length(siz)==2%  one layer data
    im=img;
    y1=zeros(siz(1));
    for i=1:siz(1)
%         disp(i)
        for j=1:siz(2)
            b= matrixcrop(im,i,j,n1,n2);
            bm=max(b(:));
            if bm==b(round(n1/2),round(n2/2)) && mean(b(:))~=b(round(n1/2),round(n2/2))
                y1(i,j)=1;
            end
        end
    end
end

% ****************************************************
if length(siz)==3  %  mutilayer data
    im=img;
    y1=zeros(size(im));
    for k=1:siz(3)
      for i=1:siz(1)
%                   disp(i)
        for j=1:siz(2)
            b= matrixcrop(im(:,:,k),i,j,n1,n2);
            bm=max(b(:));
            if bm==b(round(n1/2),round(n2/2)) && mean(b(:))~=b(round(n1/2),round(n2/2))
                y1(i,j,k)=1;
            end
        end
      end
    end % for k
end
% *******************************
y=y1;
