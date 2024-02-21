function [u, v, s, succ] = get_smallest_sing_vectors(A, z, A_sparse, start_v)
% Compute the smallest singular value and corresponding vector of A-zI.
% If A_sparse is true, PROPACK is used.


succ = true;


n = length(A);
if ~A_sparse % A is dense, so compute all the eigenvalues
  [U,S,V] = svd(A-z*eye(n));
  u = U(:,end);
  v = V(:,end);
  s = S(end,end);
  
else
  extra = 3; % works well without extra, safeguard
  opts.elr = 0; % switching elr off: this does not work so well for complex matrices
  fail = false;
  
  if ~isempty(start_v)
    opts.p0 = start_v;
  end
  
  warning('off') % annoying warning when doing A\ for badly conditioned A
  [U,S,V,bnd] = lansvd_bartvde(A-z*speye(n),1,'S',opts);
  warning('on')
  
  if norm(bnd) > 1e-14
    warning('off') % annoying warning when doing A\ for badly conditioned A
    [U,S,V,bnd] = lansvd_bartvde(A-z*speye(n),1+extra,'S',opts);
    warning('on')
  end
  
  if norm(bnd) > 1e-14
    fail = true;
  end
  
  if fail
    warning('Function lansvd failed. Exiting.')
    u = []; v = []; s = [];
  else
    u = U(:,end); s = S(end,end); v = V(:,end);
  end  
end
