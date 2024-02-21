function [f, z, ierr, iwar] = pencil_pspa(A, B, epsln, opts)
% Slightly modified version of the original pspa by
% James Burke, Adrian Lewis, Emre Mengi and Michael Overton
% to accomodate a rectangular matrix pencils A-zB.
%
% call:  [f, z] = pspa(A, B, epsln, prtlevel, plotfig, keyb, eigsolver)
%  Quadratically convergent criss-cross method to compute
%  the eps-pseudospectral abscissa of (A,B).
%
% DEFINITION:
%   The epsln-pseudospectral abscissa of (A,B) is the globally optimal value of:
%      max Re z
%      s.t. sigma_min(A - z B) = epsln     (smallest singular value)
%
% METHOD:
% The method in [2] is implemented. At each iteration given an estimate
% alpha first a vertical search finds the intersection points of the
% vertical line y=alpha and the epsln-pseudospetrum boundary. From the
% intersection points segments on the line lying inside epsln-pseudospectrum
% are determined. From the midpoint of each segment a horizontal search
% returns the rightmost intersection point of the pseudospectrum boundary and
% the horizontal line passing through the midpoint. The estimate alpha
% is refined to the largest value returned by the horizontal searches.
% Horizontal and vertical searches can be performed by solving Hamiltonian
% eigenvalue problems (for details see [2]).
%
% note: In windows user has the flexibility to choose the Hamiltonian
%       eigenvalue solver by setting the parameter eigsolver appropriately.
%       In all other platforms set eigsolver = 0, or don't specify it so
%       that Matlab's eig is used.
%
%  input
%     A         square matrix
%     B         square matrix of the same size as A
%     epsln     real >= 0 (0 implies f is spectral abscissa)
%     options structure
%       prtlevel  1: chatty; 0: prints only if problems arise (default)
%       plotfig   0: no plot, otherwise figure number for plot
%       keyb      0: no keyboard mode(default), otherwise after each
%		             iteration enter keyboard mode
%       start_z   an array of starting values (important for rectangular
%                 case since we only have a heuritsic to determine initial
%                 guesses.)
%       eigsolver Hamiltonian eigenvalue solver to be used.
%                 0: Matlab's eig (tolerances are needed to accept an
%                    eigenvalue imaginary; Default)
%                 1: HAPACK routine haeig (The eigenvalue symmetry preserving
%                    method by Benner, Mehrmann and Xu in [1]; tolerances are
%                    not needed).
%                 2: SLICOT routine hameig (The square reduced method of Van
%                    Loan [2]; preserves the eigenvalue symmetry, but half of
%                    the precision may be lost in the worst case; tolerances
%                    are not needed).
%               NOTE: 1 and 2 are currently not implemented.
%
%  output
%     f         the epsln-pseudospectral abscissa of (A,B)
%     z         one of the global maximizers except when
%               the matrices are real. If the input matrix is real
%               it contains either a global optimizer on the
%               real axis or a complex conjugate pair.
%     ierr      error flag. 0 : success.
%                           1 : Too many iterations (didn't converge).
%                           2 : Spectral abscissa cannot be improved.
%                           3 : Vertical search failed. (Odd vertical
%                               intersection points detected.)
%                           4 : Horizontal search failed. (No imaginary
%                               eigenvalue of the Hamiltonian matrix pencil is
%                               extracted.)
%     iwar      a structure of warning flags.
%               iwar.eps : 1 if epsilon is too small
%                          0 otherwise
%               iwar.sval: 1 if singular value test removed all of the
%                            vertical intersection points
%                          0 otherwise
%               iwar.start: 1 failed to find a starting z inside pseudospectrum       
%
%
%    [1] P. Benner, V. Mehrmann and H. Xu. A numerically stable,
%        structure preserving method for computing the eigenvalues
%        of real Hamiltonian or symplectic pencils. Numerische
%        Mathematik, 78(3):329-358,1998.
%    [2] J.V. Burke, A.S. Lewis and M.L. Overton. Robust stability
%        and a criss-cross algorithm for pseudospectra. IMA Journal
%        of Numerical Analysis, 23:359-375,2003.
%    [3] C.V. Loan A symplectic method for computing all eigenvalues
%        of a Hamiltonian matrix, Linear Algebra and Its Applications,
%        61, 1984, 233-251.


A = full(A);
B = full(B);

eigsolver = 0;
keyb = 0; % default: no user intervention
plotfig = 0;     % default: no plot
prtlevel = 0;    % default: no printing
start_z = [];  % prior knowledge of good starting points (we check eigenvalues to later); usefull for rectangular case

if nargin == 3
  opts = [];
end

if isfield(opts, 'eigsolver')
  eigsolver = opts.eigsolver;
end
if isfield(opts, 'keyb')
  keyb = opts.keyb;
end
if isfield(opts, 'plotfig')
  plotfig = opts.plotfig;
end
if isfield(opts, 'prtlevel')
  prtlevel = opts.prtlevel;
end
if isfield(opts, 'start_z')
  start_z = opts.start_z;
end

if isnaninf(A) || isnaninf([epsln prtlevel plotfig keyb])
  error('pspa: nan or inf arguments not allowed')
end
if isnaninf(B) || isnaninf([epsln prtlevel plotfig keyb])
  error('pspa: nan or inf arguments not allowed')
end
if epsln < 0 || imag(epsln) ~= 0
  error('pspa: epsln must be nonnegative real')
end

[m,n] = size(A);
if size(B) ~= [m n]
  error('pspa: B must have the same dimensions as A')
end

ierr = 0;
iwar.eps = 0;
iwar.sval = 0;
iwar.start = 0;

% CHANGED: For m-by-1 case we have an explicit solution
if n==1
  scale = norm(B);
  B = B/scale; A = A/scale;
  
  if norm(A)^2 - abs(B'*A)^2 > (epsln/scale)^2
    ierr = 1;
    f = NaN; z = NaN;
  else
    r = sqrt((epsln/scale)^2 - norm(A)^2 + abs(B'*A)^2);
    z = B'*A + r;
    f = real(z);
  end
return
end

% CHANGED: Determine initial iterate
if m==n, % Square case is easy
  % draw the eigenvalues of (A,B)
  eA = eig(A,B);
  if plotfig > 0
    figure(plotfig);
    plot(real(eA), imag(eA), 'ko')
    hold on
  end
  
  [x,ind] = max(real(eA));  % initial iterate
  y = imag(eA(ind));
  
else % Rectangular case more difficult, use heuristic
  
  if m > 2*n,
    R = triu(qr([B A],0));
    B = R(1:2*n,1:n);
    A = R(1:2*n,n+1:2*n);     
    [m,n] = size(A);    
    
    ll = eig(A(1:n,:), B(1:n,:));                
  else
    [Q,B] = qr(B);
    A = Q'*A;
    [m,n] = size(A);
            
    ll = eig(A(1:n,:), B(1:n,:));

  end
  ll = [start_z(:); ll(:)];
  
  start = -inf;
  % Check them one by one whether they are inside, keep the right-most.
  for ii=1:length(ll)
    if isfinite(ll(ii)),
      eps_ll(ii) = min(svd(A-ll(ii)*B));
    else
      eps_ll(ii) = inf;
    end
  end
  ll2 = [start_z(:) ll(eps_ll < epsln)'];    
  
  [~, indx] = max(real(ll2));
  if ~isempty(indx)
    start = ll2(indx);
  else
    warning('PENCIL_PSPA: Initial guess not inside the epsln-pseudo-spectrum.')
    iwar.start = 1;
    % take the one that is the closest to epsln
    %eps_ll
    [~, indx] = min(eps_ll);
    start = ll(indx);
  end
    
  x = real(start);
  y = imag(start);  
end

if prtlevel > 0
  fprintf('pspa: x = %22.15f \n', x);
  fprintf('initial estimate is calculated \n');
end

smalltol = 1e-8*max(norm(A),epsln*norm(B));

if (epsln == 0) && (m == n),  % pseudospectrum is just the spectrum
  [sortreal, indx] = sort(-real(eA));
  eA = eA(indx);
  
  % return pure spectral abscissa
  f = real(eA(1));
  
  % and the eigenvalues with real part equal to the spectral abscissa
  ind = find(real(eA) >= f - smalltol);
  z = eA(ind);
  
else   % much faster than bisection, but just as reliable
  
  if (epsln < 1e-9)
    % epsilon is too small
    iwar.eps = 1;
  end
  
  xold = -inf;
  
  
  iter = 0;
  no_imageig = 0;
  ybest = [];
  Areal = isreal(A)*isreal(B);
  
  % imagtol is used to detect zero real parts
  if eigsolver == 0
    imagtol = smalltol;
  else
    imagtol = 0;
  end
  
  while ~no_imageig && x > xold    % x is increasing in exact arithmetic
    iter = iter + 1;
    if iter > 50
      % too many steps
      ierr = 1;
      f = -1;
      z = -1;
      return;
    end
    
    % given current x, look for all relevant intersections of vertical
    % line with the pseudospectrum, process and return pair midpoints.
    % note: input x is a scalar, but output y is a vector.
    % the input ybest is a scalar.
    [y,imagtol,ierr,iwar] = pencil_pspa_imag(A, B, epsln, x, ybest, iter, imagtol, ...
      plotfig, prtlevel, eigsolver, iwar);
    
    if ierr
      f = -1;
      z = -1;
      return;
    end
    
    
    if keyb ~= 0
      keyboard
    end
    
    no_imageig = isempty(y);
    if ~no_imageig
      if prtlevel > 0
        fprintf('pspa: y = %22.15f \n', y);    % y may be a vector
      end
      % given the resulting y values, look for rightmost intersection of
      % the corresponding horizontal lines with the pseudospectrum
      % note: input y is a vector, but output x is a scalar: the max
      % of the max values.  ybest is the corresponding y value and is
      % a scalar, even if there was a tie e.g. from a complex conjugate pair.
      xold = x;
      ybestt = ybest;
      [x, ybest, ierr] = pencil_pspa_real(A, B, epsln, y, imagtol, plotfig, xold, eigsolver);
      
      if ierr
        f = -1;
        z = -1;
        return;
      end
      
      if x < xold
        x = xold;    % causes while loop to terminate
        ybest = ybestt;
        
        if prtlevel > 0
          fprintf('pspa: could not find bigger x \n')
        end
      end % end of if x < xold
      
      
      if prtlevel > 0
        fprintf('pspa: x = %22.15f  \n', x);
        fprintf('pspa: iteration %d is completed \n', iter);
      end
    end % end of if ~no_imageig
  end % end of while
  
  
  if isempty(ybest)
    % failed at the first iteration
    ierr = 2;
    f = -1;
    z = -1;
    return;
  end
  
  
  f = x;
  z = x+1i*ybest;

  if isreal(A) & isreal(B) & ~isreal(z)
    z = [z; z'];
  end
    
end