function [alphaA,dFA] = largest_real_eigenvalues_non_normality_A(N,N0,m,theta)

           
[el]=growing_non_normal_network(N,N0,m,theta);           
A=A';
alphaA = eigs(A,1,'largestreal');
dFA = non_normality_matrix(A);