function M = M_el(el,kappa,ppm)

A=A_el_directed(el);
N = size(A,1);
deg=sum(A);
A=A';
for jj = 1:length(deg)
    if deg(jj)>0
        A(jj,:) = A(jj,:)/(deg(jj));
    end
end
M=A*kappa-eye(N);
M=M*ppm;