%------------
% Author: Paraskevi Chasani
% "The UU-test for statistical modeling of unimodal data" by Paraskevi
% Chasani and Aristidis Likas
%------------
% Input: X: 1-d continuous dataset
% Output: S: subset of X, such that the cdf PL_S(X) is unimodal and
% sufficient. S is null in case of multimodality.

function S = UUtest(X)
X=sort(X); 
% success = true in case of unimodality
SG=[]; SL=[]; success=true;
PI=[min(X) max(X)];

% UU method computes the convex, intermediate and concave part of PL_S(X)
% (if exists)
[SG_,PI_,SL_,success]=UU(SG,PI,SL,X);
% S=sort([SG_ SL_]);
S=unique(sort([SG_ PI_ SL_]));   
end
