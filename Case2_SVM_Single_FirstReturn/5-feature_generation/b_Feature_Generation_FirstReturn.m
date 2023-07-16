clc
clear
close all
% load Tree_Returns
load VegPoints2


featuretable_FirstReturn=VegPoints2(:,7:9);
featuretable_FirstReturn(:,4)=VegPoints2(:,4);
save featuretable_FirstReturn featuretable_FirstReturn

% % St=size(Tree_Returns);
% % x=1:250;
% % 
% % Fitresulte=zeros(62396,21);
% for i=1:St(1)
%   i
%   if i==846 || i==8173 || i==19299   || i==25076 || i==43943
% %       
%       Tree_Returns_sm(i,:)=smooth(Tree_Returns(i,:),7,'moving');
%   else
%       Tree_Returns_sm(i,:)=smooth(Tree_Returns(i,:),5,'moving');
%   end
%   
%       
% % % % % % % peak detection
% [pks,locs,w,p] = findpeaks(Tree_Returns_sm(i,:),x,'MinPeakHeight',5,'MinPeakDistance',3,'Annotate','extents','WidthReference','halfheight');
% w=w./2;
% [xData, yData] = prepareCurveData( [], Tree_Returns_sm(i,:));
% n=nnz(locs);
% a='gauss';
% b=num2str(n);
% c=[a,b];
% % Set up fittype and options.
% ft = fittype( c );
% opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
% opts.Algorithm = 'Levenberg-Marquardt';
% opts.Display = 'Off';
% lower=ones(1,3*n);
% for q=1:n
%     lower(1,3*(q-1)+1)=10;
% end;
% clear os
% for l=1:n
% os(l,:)=[pks(1,l) locs(1,l) w(1,l)];
% end
% os=os';
% opts.StartPoint=reshape(os,1,3*n);
% % Fit model to data.
% [fitresult, gof] = fit( xData, yData, ft, opts );
% clear Fitresult;
% Fitresult=coeffvalues(fitresult);
% for p=1:3*n
%     Fitresulte(i,p)=Fitresult(1,p);
% end
% 
% % % % % % % % % % % % % % % % % % 1-integral of values of wave
% g=Tree_Returns_sm(i,:);
% % b=a(a>0);
% Integral_wave(i,1)=sum(g);
% % % % % % % % % % % % % % % % % % 2-Height of max of peak
% for l=1:n
% % Hs(1,l)=Fitresult((3*l)-2);
% % Ls(1,l)=Fitresult((3*l)-1);
% Ws(1,l)=Fitresult((3*l));
% end
% MaxHeight_wave(i,1)=max(pks);
% 
% % % % % % % % % % % % % % % % % % 3-location of max of peak
% [r,c]=find(pks==max(pks));
% LocMaxHeight_wave(i,1)=locs(r(1),c(1));
% % % % % % % % % % % % % % % % % % 4-sum of all of peak heights
% SumHeight_wave(i,1)=sum(pks);
% 
% % % % % % % % % % % % % % % % % % 5-distance between first and last peak
% FirstLastPeakDistance_wave(i,1)=locs(end)-locs(1);
% 
% % % % % % % % % % % % % % % % % % 6-witght to height ratio of first peaks;
% FirstWitghtTOHeight_wave(i,1)=Ws(1)/pks(1);
% 
% % % % % % % % % % % % % % % % % % 7-sum of witght to height rashio of peaks
% SumWitghtTOHeight_wave(i,1)=sum(Ws)/sum(pks);
% 
% % % % % % % % % % % % % % % % % % 8-Intensity of first peak
% FirstPeakIntensity_wave(i,1)=(sqrt(2*pi))*pks(1)*Ws(1);
% 
% % % % % % % % % % % % % % % % % % 9-location of first energy drop
% bs=Tree_Returns(i,:);
% f=find(-1<bs & bs<1);
% f=f(f>locs(1));
% FirstEnrDrop_wave(i,1)=f(1);
% % % % % % % % % % % % % % % % % % 10-number of peaks
% PeakNum_wave(i,1)=n;
% 
% % % % % % % % % % % % % % % % % % 11-NDSM height of first peak
% NDSMHeightFirstPeak_wave(i,1)=VegPoints2(i,4);
% 
% clear   Ws bs f
%     end


% featuretable=[Integral_wave,MaxHeight_wave,LocMaxHeight_wave,SumHeight_wave,FirstLastPeakDistance_wave,FirstWitghtTOHeight_wave,SumWitghtTOHeight_wave,FirstPeakIntensity_wave,FirstEnrDrop_wave,PeakNum_wave,NDSMHeightFirstPeak_wave];
% featuretable_JustSmooth=featuretable;
% save featuretable_JustSmooth featuretable_JustSmooth
