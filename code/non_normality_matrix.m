function [dFA]=non_normality_matrix(A)
% calculate the non-normality of the matirx A
% 
% INPUT: adjacency matrix (A)
% OUTPUT: non-normaliy of matrix A (dFA)

[~,d]=eig(A);
eigvalue=diag(d);
sumeigvalue=sum(eigvalue.^2);        
dFA = (norm(A,'fro').^2- sumeigvalue)^(0.5)/(norm(A,'fro'));