function [SG_,PI_,SL_,success]=UU(SG,PI,SL,X)
% Input:  SG = convex part, PI = intermediate part, SL = concave part, 
%         X = 1-d dataset
% Output: updated versions of SG, PI, SL if success (unimodality) = true
SG_=SG; SL_=SL;
PG=[];PL=[];
xx=intersect(X(X>=PI(1)),X(X<=PI(2)));
if ks(xx)==1 %uniform
    SG_=SG; PI_=PI; SL_=SL;
    success=true;
    return
end
% Compute gcm/lcm points 
[gcm,lcm,~,~,~]=compute_gcmlcm2(xx);
% Check if GL is consistent and obtain consistent subsets
[C,ind,sz]=consistent(gcm,lcm);
for i=1:sz
    pos=min(find(ind{1,i}==1));
    if ~isempty(pos)&&  pos~=1
        c=pos-1;        
        PG=C{1,i}(1:c);
        PI_=[C{1,i}(c) C{1,i}(c+1)];
        PL=C{1,i}(c+1:length(C{1,i}));
        % Determine sufficient subsets of the convex part
        [PG_,success]=sufficient(PG,X);
        if success==false
            continue
        end
        % Determine sufficient subsets of the concave part
        [PL_,success]=sufficient(PL,X);
         if success==false
            continue
         end
        SG_=[SG_ PG_];
        SL_=[SL_ PL_];
    elseif pos==1
        PI_=[];
        PL=C{1,i};
        [PL_,success]=sufficient(PL,X);
         if success==false
            continue
         end
         SL_=[SL_ PL_];
    else
        PI_=[];
        PG=C{1,i};
        [PG_,success]=sufficient(PG,X);
         if success==false
            continue
         end
         SG_=[SG_ PG_];
    end
    if success==true 
        if ~isempty(PI_)
            [SG_,PI_,SL_,success]=UU(SG_,PI_,SL_,X);
            if success==false
                continue;
            end
        end
        return    
    end
end
if success==false
   PI_=[]; SG_=[]; SL_=[];
end   

        