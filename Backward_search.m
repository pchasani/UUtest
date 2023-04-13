function [PB,success] = Backward_search(PB,eR,X)
% Input: PB: set of points which form uniform sets
%        eR: data point which causes non-uniformity
%        X: 1-d dataset
% Output: PB: updated set of points which form uniforms sets X(si,sj)
%         success: true if insufficiency is fixed, otherwise false

% This method searches backward for uniform sets
% If X(s_i, s_(i+1)) is not uniform, it tests X(s_m, s_(i+1)) , m < i for uniformity .
success=false;
PB(length(PB))=[];
while length(PB)>=1
    xx=intersect(X(X>=max(PB)),X(X<=eR));
    if ks(xx)==1
        PB=[PB eR];
        success=true;
        return   
    end
    PB(length(PB))=[];
end
end