function [f, info] = subspace_pspa(A, epsln, options)
% SUBSPACE_PSPA: Subspace method for computing the Pseudospectral Abscissa
%
%  f = SUBSPACE_PSPA(A, epsln) normally returns
%    the epsln-pseudospectral ABSCISSA of the matrix A defined by
%       max {real(z): z is an eigenvalue of B with ||A-B|| <= epsln}
%    and is guaranteed to be a lower bound.  A can be dense or sparse.
%
%  [f, info] = SUBSPACE_PSPA(A, epsln) also returns an info structure
%    info.succ:     false if there was an error during the iteration
%    info.its:      number of iterations
%    info.z_pspa:   the right-most points of the reduced pencils
%    info.nb_eigs:  number of eigenvalue computations
%    info.stop_msg: the reason why the iteration stopped
%
%  [f, x, y, z] = SUBSPACE_PSPA(A, epsln, options)
%    allows specification of the following options:
%  
%    options.maxit:    maximum number of iterations (default 100)
%    options.ftol:     termination tolerance based on f (default 1e-12)  
%      if ftol < 0, the iteration stops when numerically stagnated
%    options.prntlvl:  print level 
%      0 = no output; 1 = minimal output (default); 2 = verbose output
%    options.exact:    exact value of f; for debugging
%      prints absolute and relative error of approximation
%    options.tol_svd:  tolerance for switching to SVD only (default 0.1)
%      if tol_svd < 0, the algorithm will always perform EIG computations
%    options.restart:  maximum size of the subspace before restarting with
%      best approximation (default = 30)
%    options.start_z:  the starting guess (default [], which implies the
%      right-most eigenvalue)
%    options.sparse:   use a sparse EIG and SVD (default issparse(A))
%    options.debug:    store debug info in debug/dump.mat (default is false)
%
%  SUBSPACE_PSPA is primarily intended for either
%    1) dense matrices of moderate size (100 < n < 1000); or
%    2) sparse matrices that can be solved efficiently by sparse LU;
%  although it works for any size. For rather small matrices (n < 100),
%  use the code from http://www.cs.nyu.edu/mengi/robuststability.html .
%
%  Reference: Daniel Kressner and Bart Vandereycken, Subspace methods for 
%       computing the pseudospectral abscissa and the stability radius, 
%       submitted to SIAM J. Mat. Anal. Appl.

%  Version 0.1, Mar 15, 2012.
%  Version 0.2, Nov 26, 2013 (Fix for R2013b).
%  Version 0.3, Mar 08, 2014 (Added debug dump).



if nargin==2
  options = {};
end

if ~isfield(options, 'maxit')
  options.maxit = 100;
end
if ~isfield(options, 'ftol')
  options.ftol = 1e-12;
end
if ~isfield(options, 'prntlvl')
  options.prntlvl = 1;
end
if ~isfield(options, 'exact')
  options.exact = NaN;
end
TOL_SVD = 0.1;
if isfield(options, 'tol_svd')
  TOL_SVD = options.tol_svd;
end
if ~isfield(options, 'restart')
  options.restart = 30;
end
if ~isfield(options, 'start_z')
  options.start_z = [];
end
if ~isfield(options, 'sparse')
  options.sparse = issparse(A);
end
if ~isfield(options, 'debug')
  options.debug = false;
end


 
if ~issparse(A)
  % we shift with complex z anyway
  A = schur(A, 'complex');
end

f = -inf;

info.succ = true;
info.its = 1;

if isfinite(options.exact)
  if options.sparse
    options.normA = normest(A);
  else
    options.normA = norm(A,2);
  end
end

% VR will contain the subspace.
% For simplicity, we make a dynamic matrix. Preallocation can improve
% speed.
VR = [];

% The first step is always EIG unless we have a good starting guess
do_eig = true;

n = size(A,1);
if ~isempty(options.start_z)
  z = options.start_z;
  [u, v, s2, succ] = get_smallest_sing_vectors(A, z, options.sparse, []);
  
  err_sing = abs(s2(end) - epsln)/abs(epsln);
  if err_sing<TOL_SVD, do_eig = false; else do_eig = true; end
  if succ==0
    if prntlvl
      fprintf('Function get_smallest_sing_vectors failed. Exiting...\n')      
    end
    info.succ = false;
    info.its = 0;
    return
  end         
  u = -u;
  
  info.z_pspa = z;
  VR = v;
else
  u = zeros(n,1); v = u;
  VR = [];
  info.z_pspa = [];
end


z_old = -inf;
z = -inf;
info.nb_eigs = 0;


%%% The main loop
for k = 1:options.maxit,
  
  %%% Add a vector to the subspace
  if do_eig % Compute right eigenvector x of A + eps*u*v'            
    [lambda, x, succ] = get_rightmost_eigvec(A, epsln, -u, v, options.sparse);
    f = real(lambda);
    info.nb_eigs = info.nb_eigs + 1;

    if ~succ
      if options.prntlvl>=1, fprintf('Function get_rightmost_eigvec failed. Exiting...\n'); end
      info.succ = false; info.its = k;
      return
    end
  
  else % Reuse the SVD
    x = v;    
  end  
  [VR,~] = qr([VR x],0);
  
  
  %%% Compute the right-most point for the reduced pencil
  opts_pspa.start_z = z;
  [f_pspa, z_pspa, err_pspa] = pencil_pspa(A*VR, VR, epsln, opts_pspa);     
  if options.debug
    data{k}.AA = A*VR;
    data{k}.BB = VR;
    data{k}.epsilon = eps;
    data{k}.z = z_pspa(1);
    data{k}.lambda = lambda;
  end
  
  if err_pspa==2    % pencil_pspa could not be improved. 
    z = z_old;            % This is OK (converged); take previous iterate.
  else
    z = z_pspa(1);
  end
  info.z_pspa = [info.z_pspa z];     
  f = max(f, real(z));
  
  %%% Check for convergence. Break if stagnated/convergend.
  [converged, info] = check_convergence(z, z_old, info, options, err_pspa);
  if converged, break; end
  z_old = z;
  
    
  %%% Compute the perturbation to get to the current iterate.
  if k>1
    start_v = v;  % reuse previous singular vector; helps for sparse SVD.
  else
    start_v = [];
  end
  [u, v, s2, succ] = get_smallest_sing_vectors(A, z, options.sparse, start_v);
  if succ==0
    if options.prntlvl>=1, fprintf('Function get_smallest_sing_vectors failed. Exiting...\n'); end
    info.succ = false; info.its = k;
    return
  end
  
  
  %%% Check whether we need to do an EIG in the next iteration.
  err_sing = abs(s2(end) - epsln)/abs(epsln);
  if err_sing<TOL_SVD, do_eig = false; else do_eig = true; end
             
  
  %%% Restart if necessary.
  if size(VR,2)==options.restart+1
    [UU,ss,VV] = svd(A*VR-z*VR,0);
    VR = VR*VV(:,end);    
  end      
end


info.its = k;
if options.debug
    save debug/dump.mat data
end