function CompareHU(A_pred, S_pred, A_gt, S_gt)

%load Data
A = A_pred;
S = S_pred;

%Ground Truth
W = A_gt;
H = S_gt;

n = size(W,1);
k = size(W,2);

% match pairs
A_n = (A-repmat(mean(A),n,1))./repmat(std(A),n,1) ;
S_n = S./repmat(sum(S),k,1);
W_n = (W-repmat(mean(W),n,1))./repmat(std(W),n,1);
H_n = H./repmat(sum(H),k,1);
[A_s,S_s,W_s,H_s]=match_pairs(A_n,S_n,W_n,H_n);

% evaluate performance
[SAD,RMSE,~]=performance_eval(A_s,S_s,W_s,H_s);
fprintf('\nHyperspectral Unmixing Performance\n----------------------------------\nSAD = %.4f | RMSE = %.4f\n',SAD,RMSE);

%plot spectra
for i=1:4
subplot(2,2,i);
plot(W_s(:,i), 'b', 'LineWidth',1.5);
hold on;
plot(A_s(:,i), 'r', 'LineWidth',1.5);
legend('Ground Truth','Estimated');
pos = get(gca, 'Position');
pos(3) = 0.40;
pos(4) = 0.40;
set(gca, 'Position', pos)
end
end