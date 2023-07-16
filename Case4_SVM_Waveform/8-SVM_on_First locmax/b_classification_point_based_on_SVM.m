clc
clear
close all
[image,RO]=geotiffread('2013_SJER_AOP_Camera_sample.tif');
load First_LocMax
load TestTrain
load TestTrain_GT
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
First_LocMax_Data_SVM=First_LocMax_Data;
First_LocMax_Data_SVM(:,12:14)=[];   %%%% choon SVM bar asase 11 vizhegi bayad Amozesh dade shavad va classification konad...
% % %  our data is Normalized but in [0,1] range. we want them to be in
% [-1,1]. so ....
% First_LocMax_Data_Net=(First_LocMax_Data_Net.*2)-1;

Train=TestTrain;
GT=TestTrain_GT;
format long g



Nclass=length(unique(TestTrain_GT));
Nband=size(TestTrain,2);



% % % % % learning the classifier 
classificationSVM = fitcsvm(...
    Train, ...
    GT, ...
    'BoxConstraint', 1, ...    
    'KernelFunction', 'polynomial', ...    'KernelFunction', 'gaussian', ...   'KernelScale', 0.4, ...
    'PolynomialOrder',5,...
    'KernelScale', 'auto', ...
    'Standardize', true);

% % % % % % %  Classification of Train for SVM Classifir Assessment
classification_Test=predict(classificationSVM,Train);

[C,order] = confusionmat(GT,classification_Test);%%%% or [C_Train2] = CalcConfMat_Fcn(Train_GT,classes_Train,2);

G=sum(C');
M=sum(C);
S=sum(sum(C));
ObservedAccuracy=(sum(diag(C))/S);
RandomAccuracy=(G(1)*M(1)+G(2)*M(2))/(S*S);
kappa_Test=(ObservedAccuracy-RandomAccuracy)/(1-RandomAccuracy);
kappa_Test   
% % % % % % % % % % % % % % % % % % % % % % % % %     

 classification=predict(classificationSVM,First_LocMax_Data_SVM);





First_LocMax_Data(:,15)=classification;  %%%% classes be matrix avalie attach shodand

classification_Map=zeros(1000);
for i=1:size(First_LocMax_Data,1)
  classification_Map(First_LocMax_Data(i,13),First_LocMax_Data(i,14))=First_LocMax_Data(i,15);
end

First_LocMax_SVM_Classes=First_LocMax;
First_LocMax_SVM_Classes(:,:,15)=classification_Map;    %%%% haman matrix avalie ast faghat classification map be an ezafeh shode

 Geotiffsave_DS(classification_Map,RO, 'classification_Map')
  Geotiffsave_DS(First_LocMax_SVM_Classes,RO, 'First_LocMax_SVM_Classes')

% % %   ia inja be baad ham noghati ke class anha 2 ast (edges) hazf
% mishavand
  segment=First_LocMax_SVM_Classes(:,:,12);
  bin=First_LocMax(:,:,11);
  bin(bin>0)=1;
 for i=1:139
     i
   p=segment(segment==i);
   if size(p,1)>3
       
    bin(segment==i & classification_Map==2)=0;

    end
    
   
 end
 second_SVM_Classified=bin.*First_LocMax_SVM_Classes;
 save second_SVM_Classified second_SVM_Classified
   Geotiffsave_DS(second_SVM_Classified,RO, 'second_SVM_Classified')
   nnz(bin)
