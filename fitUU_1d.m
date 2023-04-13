function [S,p]=fitUU_1d(X)
%Input:   X: 1-d dataset
%Output:  S: subset of X, such that the cdf PL_S(X) is unimodal and sufficient.
%         p: percentage of data points in each interval [S_i,S_{i+1}]

% This method fits UU model to 1-d data 
X=sort(X); N=length(X);
S=UUtest(X); S=S';
S(1:length(S)-1,2)=S(2:length(S));
S(length(S),:)=[]; 
p=zeros(size(S,1),1);
if size(S,1) == 1
    p=1;
    return;
end
% Compute perecentage p of data points in each interval [S_i,S_{i+1}]
for i=1:size(S,1)-1
    p(i)=length(intersect(X(X>=S(i,1)),X(X<S(i,2))))/N;
end
p(i+1)=length(intersect(X(X>=S(i+1,1)),X(X<=S(i+1,2))))/N;
end
