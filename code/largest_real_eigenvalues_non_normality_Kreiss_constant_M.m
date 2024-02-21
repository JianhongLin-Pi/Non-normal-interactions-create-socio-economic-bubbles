function [alphaM,dFM,KM] = largest_real_eigenvalues_non_normality_Kreiss_constant_M(N,N0,m,theta,kappa,ppm)



low=-3;
h=0.1;
high=1;

[el]=growing_non_normal_network(N,N0,m,theta);  
M = M_el(el,kappa,ppm);
[KM] = kreiss_constant(M,low,h,high);

alphaM = eigs(M,1,'largestreal');
dFM = non_normality_matrix(M);