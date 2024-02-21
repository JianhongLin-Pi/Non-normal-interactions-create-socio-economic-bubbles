function [z, x, succ, mu] = get_rightmost_eigvec(A, scalefac, u, v, A_sparse)
% get right-most eigenvalue (z) and right eigenvector (x)
% of B = A + scalefac*u*v'

eigsplus_fn = getEigsPlus();

n = length(u); % length(A) does not work if A is a function handle
% eigenvalues of A+scalefac*u*v'
if ~A_sparse % A is dense, so compute all the eigenvalues
    B = A + scalefac*u*v';
    [X, Lambda] = eig(B);
    lambda = diag(Lambda);

    succ = 1;
    
    % lambda = diag(Lambda); (for eigs; eigsplus returns a vector of eigenvalues)
    % sort eigenvalues: they are not sorted by eig, and although they are by eigs,
    % conjugate pairs are sorted inconsistently so resort
    [lamsort, indx] = sortcomplex(lambda, 0);
    z = lamsort(1); % same as lambda(indx(k))
    x = X(:,indx(1)); % corresponding eigenvector
    mu = lambda(indx(1));
else
  
    opts.disp = 0; % for eigs
    opts.isreal = isreal(A) & isreal(scalefac) & isreal(u) & isreal(v); % for eigs, when Atype== 3
    eigscode = 'LR'; % want eigenvalue(s) with largest real parts
    
    % experiments show that the cpu time for the right eigenvectors is
    % substantially more than for the left eigenvectors, and that this is
    % true even if the original A is replaced by A'
    % is this because the data structures for representing A favor
    % multiplying by A' not by A?
    %
    % first the right eigenvectors
    Afun = @(p)aplusuvt(A, 2, scalefac, u, v, 0, p);
    if norm(v,1) > 0 
        opts.v0 = v;  % v is the previous x, except at initial iterate where it may be 0
    end
    % [X, Lambda] = eigs(Afun, n, k + extra, eigscode, opts); 
    % Tim Mitchell's modification to eigs eliminates the horrible
    % possibility of eigs returning a vector whose largest real part is
    % zero which is not genuine but the result of failure to converge!
    
    wrn = warning('off');
    [X, lambda] = eigsplus_fn(Afun, n, 1, eigscode, opts);  
    warning(wrn)
    
    if isempty(lambda) || isnan(lambda)
      warning('Taking larger subspace')
      wrn = warning('off');
      %opts.p = 40;
      extra = 10; 
      [X, lambda] = eigsplus_fn(Afun, n, extra, eigscode, opts); 
      warning(wrn)
    end
    
%     if isempty(lambda) && n < 500
%         warning('geteigvecs: eigs found no eigenvalues to default accuracy. Switchin to full EIG since n is small enough.')
%         B = A + scalefac*u*v';
%         [X, Lambda] = eig(B);
%         lambda = diag(Lambda);
%         succ = 2;
%         
%         % lambda = diag(Lambda); (for eigs; eigsplus returns a vector of eigenvalues)
%         % sort eigenvalues: they are not sorted by eig, and although they are by eigs,
%         % conjugate pairs are sorted inconsistently so resort
%         [lamsort, indx] = sortcomplex(lambda, 0);
%         z = lamsort(1); % same as lambda(indx(k))
%         x = X(:,indx(1)); % corresponding eigenvector
%         
%         return
%     else
    if isempty(lambda)
        %warning('geteigvecs: eigs found no eigenvalues to default accuracy. Exiting.')
        succ = 0;
        z = []; x = [];
        return
    else
      succ = 1;
      
      % lambda = diag(Lambda); (for eigs; eigsplus returns a vector of eigenvalues)
      % sort eigenvalues: they are not sorted by eig, and although they are by eigs,
      % conjugate pairs are sorted inconsistently so resort
      [lamsort, indx] = sortcomplex(lambda, 0);
      z = lamsort(1); % same as lambda(indx(k))
      x = X(:,indx(1)); % corresponding eigenvector
    end
    
end


