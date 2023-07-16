clc
clear
close all
% % % % % % Data Loading
load TestTrain
load TestTrain_GT
Data=TestTrain;
GT=TestTrain_GT;

InputNum=size(Data,2);
% OutputNum=size(Train_GT,2);
OutputNum=2;
% % % % % % Normalization
% % %  our data is Normalized but in [0,1] range. if we want them to be in
% [-1,1] we can ....
% Data=(Data.*2)-1;
% % % % % % % %


% % % % Output coding
GT2=zeros(size(GT,1),2);

for i=1:size(GT,1)
   GT2(i,GT(i))=1;
end



% % % % Network Structure
Pr=[0,1];
PR=repmat(Pr,InputNum,1);

Network=newff(PR,[10,10,OutputNum],{'tansig','tansig','purelin'});
% Network.trainParam.epochs = 2000;
% % % % Training

Network=train(Network,Data',GT2');
% % % % % % % % Assessment

Data_Net=((sim(Network,Data'))');

% % % % Get Classes
classes_Net=CalcClasses_Fcn(Data_Net);

[C,order] = confusionmat(GT,classes_Net);%%%% or [C_Train2] = CalcConfMat_Fcn(Train_GT,classes_Train,2);

G=sum(C');
M=sum(C);
S=sum(sum(C));
ObservedAccuracy=(sum(diag(C))/S);
RandomAccuracy=(G(1)*M(1)+G(2)*M(2))/(S*S);
kappa=(ObservedAccuracy-RandomAccuracy)/(1-RandomAccuracy);

% % % Display
figure;
plot(GT,'-or')
hold on
plot(classes_Net,'-sb')
hold off
%  save Network Network
