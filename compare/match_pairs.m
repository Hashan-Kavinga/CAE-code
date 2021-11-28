function [A_s,S_s,W_s,H_s]=match_pairs(A_n,S_n,W_n,H_n)

r = size(S_n,1);
corrAW = (corr(A_n,W_n));
corrAW(isnan(corrAW)) = eps;

for i=1:r
    maximum = max(max(corrAW));
    [p,q] = find(corrAW==maximum);
    p = p(1);
    q = q(1);
    idx(q) = p;
    corrAW(:,q) = -inf;
    corrAW(p,:) = -inf;
    cc(p) = maximum;
end

A_s = A_n(:,idx);
S_s = S_n(idx,:);
W_s = W_n;
H_s = H_n;

end