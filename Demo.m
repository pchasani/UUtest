%%% Demo %%%
close all;clear;clc;

%unimodal dataset
 X=normrnd(0,1,1,1000);

%multimodal dataset
%  X1=normrnd(0,1,1,1000); X2=normrnd(7,1,1,1000);
%  X=[X1 X2];

S=UUtest(X);
if isempty(S) %multimodal dataset
    disp('The dataset is multimodal.')
    return
end
    
% Fit UU model to data
[S,p]=fitUU_1d(X);  

% Ecdf plot and Cdf of the fitted model
[y_cdf,x]=cdfUU(X,S,p);
ecdfplot(X);
figure(2);hold on; 
plot(x,y_cdf,'k--','LineWidth',2);hold on;
legend('ecdf','gcm','lcm','cdfUU','Location','northwest');legend('boxoff');
hold off;

%Histogram and and Pdf of the fitted model
figure(1);hold on; 
[y_pdf,x]=pdfUU(X,S,p);
plotpdf=plot(x,y_pdf,'k--','LineWidth',2);hold on;
legend(plotpdf,'pdfUU','Location','northwest');legend('boxoff');
hold off;