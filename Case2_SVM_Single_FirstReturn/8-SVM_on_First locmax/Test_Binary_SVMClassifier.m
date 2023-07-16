clc
clear 
close all
load TestTrain
load TestTrain_GT
load First_LocMax
I=reshape(First_LocMax,1000000,5);
I(:,5)=[];
I1=I(:,4);
[r,c]=find(I1~=0);
First_LocMax_Data=I(r,:);


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
    'PolynomialOrder',3,...
    'KernelScale', 'auto', ...
    'Standardize', true);

% % % % % % %  Classification of Image
classification_Test=predict(classificationSVM,Train);

CM=zeros(Nclass,Nclass);
    class=1:Nclass;
    for k=1:Nclass
        for t=1:Nclass
            CM(k,t)=length(find((classification_Test==class(k))&(GT==class(t))));
        end
    end

        SumMod=0;
    for l=1:Nclass
        SumMod=SumMod+sum(CM(:,l))*sum(CM(l,:));
    end
    Kappa1=round((((sum(sum(CM))*trace(CM))-SumMod)/((sum(sum(CM))^2)-SumMod))*100)/100;
    
    Kappa1
    
    
[C,order] = confusionmat(GT,classification_Test);%%%% or [C_Train2] = CalcConfMat_Fcn(Train_GT,classes_Train,2);

G=sum(C');
M=sum(C);
S=sum(sum(C));
ObservedAccuracy=(sum(diag(C))/S);
RandomAccuracy=(G(1)*M(1)+G(2)*M(2))/(S*S);
kappa2=(ObservedAccuracy-RandomAccuracy)/(1-RandomAccuracy);
 kappa2   
    
 classification=predict(classificationSVM,First_LocMax_Data);



% Classification=reshape(classification,m,n); 
% figure;
%     imagesc(Classification)
%     %----------------------------------------------------------------------
%     %---------------------------------------------------------------------- Calculation of Kappa coefficient 
%     CM=zeros(Nclass,Nclass);
%     class=1:Nclass;
%     for k=1:Nclass
%         for t=1:Nclass
%             CM(k,t)=length(find((Classification==class(k))&(Test==class(t))));
%         end
%     end
%     SumMod=0;
%     for l=1:Nclass
%         SumMod=SumMod+sum(CM(:,l))*sum(CM(l,:));
%     end
%     Kappa=round((((sum(sum(CM))*trace(CM))-SumMod)/((sum(sum(CM))^2)-SumMod))*100)/100;
%     Fitness(len,1)=0.8*(1-Kappa)+0.2*(length(tt)/173);
% %     Fitness(len,1)=(1-Kappa);
% 
% end
% end