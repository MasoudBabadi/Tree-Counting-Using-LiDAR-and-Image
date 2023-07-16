clc
clear
close all
load Tree_Returns
load VegPoints2

St=size(Tree_Returns);
x=1:250;
% q=0;
% for k=5
%     q=q+1
Fitresulte=zeros(62396,21);
for i=1:St(1)
  i
  Tree_Returns_sm(i,:)=smooth(Tree_Returns(i,:),5,'moving');
% % % % % % peak detection
[pks,locs,w,p] = findpeaks(Tree_Returns_sm(i,:),x,'MinPeakHeight',5,'MinPeakDistance',3,'Annotate','extents','WidthReference','halfheight');
s=size(pks);
n(i)=s(2);

    end

AddsOfHighNumPeaks=find(n>=9);
save AddsOfHighNumPeaks AddsOfHighNumPeaks

