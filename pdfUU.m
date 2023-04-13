function [y,X]=pdfUU(X,S,p)
%Input:   X: 1-d dataset
%         S: subset of X, such that the cdf PL_S(X) is unimodal and sufficient.
%         p: percentage of data points in each interval [S_i,S_{i+1}]
%Output:  y: pdf P(x) values of the UMM
%         X: 1-d dataset
% This method computes pdf P(x) values of the UMM on the dataset X

X=sort(X);
y=zeros(length(X),1); 
for i=1:length(X)
    for j=1:size(S,1)
        if X(i)>=S(j,1) &&  X(i)<S(j,2)
            y(i)=p(j)*1/(S(j,2)-S(j,1));
            break;
        end
    end
    if X(i) == S(end,2)
       y(i)=p(end)*1/(S(end,2)-S(end,1));
    end
end
