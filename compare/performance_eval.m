function [SAD,RMSE,Kurtosis] = performance_eval(A_s,S_s,W_s,H_s)

[r,m] = size(H_s);
    A_s(A_s==0)=eps;
    A_s(isnan(A_s))=eps;
    S_s(S_s==0)=eps;
    S_s(isnan(S_s))=eps;


    
SAD = 0;
for i=1:r

    p = A_s(:,i); q=W_s(:,i);
    tempSAD = acos(dot(p,q)/(norm(p)*norm(q)))
    SAD = SAD+tempSAD;
end
SAD = SAD/r;

RMSE = 0;
for i=1:r
    p = S_s(i,:); q=H_s(i,:);
    tempRMSE = sqrt(nansum((p-q).^2)/m)
    RMSE = RMSE+tempRMSE;
end
RMSE = RMSE/r;

Kurtosis = 0;
for i=1:r
    p = A_s(:,i);
    Kurtosis = Kurtosis+kurtosis(p);
end
Kurtosis = Kurtosis/r;
end

