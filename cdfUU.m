function [y,X]=cdfUU(X,S,p)
%Input:   X: 1-d dataset
%         S: subset of X, such that the cdf PL_S(X) is unimodal and sufficient.
%         p: percentage of data points in each interval [S_i,S_{i+1}]
%Output:  y: cdf F(x) values of the UMM
%         X: 1-d dataset
% This method computes cdf F(x) values of the UMM on the dataset X

X=sort(X); y=zeros(1,length(X));
for i=1:length(X)
    if X(i)<S(1,1)
        y(i)=0; 
    elseif X(i)>=S(1,1) && X(i)<=S(end,2)
        for j=1:size(S,1)           
            if X(i)>=S(j,1) && X(i)<=S(j,2)
                y(i)= sum(p(1:j-1))+ p(j)*((X(i)-S(j,1))/(S(j,2)-S(j,1)));
                break;
            end
        end        
    elseif X(i)>S(end,2)
        y(i)=1; 
    end
    if length(y)==i-1
        y(i)=y(i-1);
    end
end
end