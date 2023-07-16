clc
clear
close all
[image,RO]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
load First_LocMax
% % % %  ezafe kardane shomareye satr va soton be matrix baraye peyda
% kardane pixel haye delkhah
a=ones(1000,1000);
for i=1:1000
    a(i,:)=i;
end
b=ones(1000,1000);
for i=1:1000
    b(:,i)=i;
end
 First_LocMax(:,:,13)=a;     First_LocMax(:,:,14)=b;    

% % % %  data perepare baraye vared shodan be Network
I=reshape(First_LocMax,1000000,14);
I1=I(:,11);
[r,c]=find(I1~=0);
First_LocMax_Data=I(r,:);
First_LocMax_Data_Net=First_LocMax_Data;
First_LocMax_Data_Net(:,12:14)=[];   %%%% choon network bar asase 11 vizhegi amozesh dideh 
% % %  our data is Normalized but in [0,1] range. we want them to be in
% [-1,1]. so ....
% First_LocMax_Data_Net=(First_LocMax_Data_Net.*2)-1;

load Network
First_LocMax_class=(sim(Network,First_LocMax_Data_Net'))';
classes_Net=CalcClasses_Fcn(First_LocMax_class);


First_LocMax_Data(:,15)=classes_Net;  %%%% classes be matrix avalie attach shodand

classification_Map=zeros(1000);
for i=1:size(First_LocMax_Data,1)
  classification_Map(First_LocMax_Data(i,13),First_LocMax_Data(i,14))=First_LocMax_Data(i,15);
end

First_LocMax_ANN_Classes=First_LocMax;
First_LocMax_ANN_Classes(:,:,15)=classification_Map;    %%%% haman matrix avalie ast faghat classification map be an ezafeh shode

 Geotiffsave_DS(classification_Map,RO, 'classification_Map')
  Geotiffsave_DS(First_LocMax_ANN_Classes,RO, 'First_LocMax_ANN_Classes')

% % %   ia inja be baad ham noghati ke class anha 2 ast (edges) hazf
% mishavand
  segment=First_LocMax_ANN_Classes(:,:,12);
  bin=First_LocMax(:,:,11);
  bin(bin>0)=1;
 for i=1:139
     i
   p=segment(segment==i);
   if size(p,1)>3
       
    bin(segment==i & classification_Map==2)=0;

    end
    
   
 end
 second_ANN_Classified=bin.*First_LocMax_ANN_Classes;
 save second_ANN_Classified second_ANN_Classified
   Geotiffsave_DS(second_ANN_Classified,RO, 'second_ANN_Classified')
   nnz(bin)
