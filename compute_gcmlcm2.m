function [gcm,lcm,gcmf,lcmf,F]=compute_gcmlcm2(X)
% Input:  X: 1-d dataset
     
% Output: (gcm,gcmf), (lcm,lcmf) : gcm and lcm points of X
%         F: Ecdf function of X

% This method computes gcm/lcm points of dataset X
[F,x] = ecdf(X);
F=F(2:end); x=x(2:end);
if length(x)<3
    gcm=x(1); lcm=x(2); gcmf=F(1); lcmf=F(2);
    return
end
K=convhull(x',F');
    KK=x(K); KF=F(K);      
    gcm=[];  lcm=[];  gcmf=[];lcmf=[];
for i=1:length(K)
    if (K(i)<length(F))
        gcm=[gcm x(K(i))];
    else
        break
    end
end
for j=i:length(K)-1
    lcm=[lcm x(K(j))];
end
lcm=sort(lcm);
for i=1:length(gcm)
    for j=1:length(KK)
        if gcm(i)==KK(j)
            gcmf=[gcmf KF(j)];
        end
    end
end
lcm=sort(lcm);
for i=1:length(lcm)
    for j=1:length(KK)
        if lcm(i)==KK(j)
            lcmf=[lcmf KF(j)];
        end
    end
end
