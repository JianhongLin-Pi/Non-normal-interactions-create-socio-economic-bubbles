function [KM] = kreiss_constant(M,low,h,high)



alpha_epsln_vec = [];
epsln_vec = [];

for epsln = low:h:high
    disp(epsln);
    alpha_epsln = subspace_pspa(M, 10^(epsln));
    if alpha_epsln < 0
        alpha_epsln_vec = [alpha_epsln_vec 0];
    else
        alpha_epsln_vec = [alpha_epsln_vec alpha_epsln/(10^epsln)];
    end
    %epsln_vec = [epsln_vec epsln];
end
KM = max(alpha_epsln_vec);