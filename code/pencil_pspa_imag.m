function [ynew,newimagtol,ierr,iwar] = pencil_pspa_imag(A, B, epsln, x, ywant, iter, imagtol, ...
     plotfig, prtlevel, eigsolver,iwar)
% Slightly modified version of m file provided by
% James Burke, Adrian Lewis, Emre Mengi and Michael Overton
% (Last updated on March 10th 2005)
%
% called by pspa.m
%
% Search for intersections between vertical line with given x component
% and the pseudospectrum.  Start by looking for imaginary eigenvalues of
% Hamiltonian matrix pencil; if there are none, return the empty vector for ynew.
% Otherwise, remove any non-extreme imaginary eigenvalues that don't correspond 
% to the smallest singular value.  Then sort the eigenvalues into pairs.
% As do so, ensure that "ywant" (a scalar) is in the eigenvalue list, and if 
% not, add an extra pair above and below ywant (unless the pair containing 
% ywant is already a very short interval, indicating near convergence to a
% maximizer).  The omission must be caused by rounding, and if we overlook 
% this, the process could terminate to a local minimizer of the 
% pseudospectrum instead of a global maximizer (consider minus
% the 5,5 Demmel matrix with epsln = 0.01).
% Finally, return the pair midpoints; there must be at least one.

Areal = isreal(A)*isreal(B);
[m,n] = size(A);
ierr = 0;

BB = A - x*B;

% CHANGED: Matrix to accomodate rectangular pencil.
if eigsolver == 0
    eM = eig([-BB'  epsln*eye(n);  -epsln*eye(m)  BB], blkdiag(B',B));    
else
    error('Functionality not implemented.');
end


minreal = min(abs(real(eM)));

% tolerance is adaptive, i.e. if vertical search fails
% in the first iteration that means tolerance is too small.
% So increase the tolerance.
if (iter == 1) && (minreal > imagtol)
    imagtol = minreal + imagtol;
end

newimagtol = imagtol;


if minreal > imagtol    % check if M has an imaginary eigenvalue
    ynew = [];
else
    indx = find(abs(real(eM)) <= imagtol);  % extract such eigenvalues
    % make sure the imaginary parts correspond to the minimum singular 
    % value, not some other singular value
    y = sort(imag(eM(indx)));  % order them by increasing imaginary part
   

    % singular value tests
    % remove the imaginary eigenvalues if they don't correspond to the
    % minimum singular value
    indx2 = 1;       % check out the non-extreme imaginary parts
    for check = 2: length(indx)-1   % does nothing if there are only 2
        j = check;
        Ashift = A - (x + 1i*y(j))*B;
        s = svd(Ashift);
        [minval,minind] = min(abs(s-epsln));
         
        if (minind == n)
            indx2 = [indx2; j];   % accept this eigenvalue
        end
    end   
    indx2 = [indx2; length(indx)];  % last one is an extreme one
    removed = length(indx) - length(indx2);
   
    if removed > 0
        if (prtlevel > 0)
            fprintf('pspa_imag: singular value test removed %d eigenvalues \n', removed)
        end
        y = y(indx2);
    end
    
    
   
  
   npairs = length(y)/2;   
   if floor(npairs) ~= npairs

      % odd number of intersection points detected by the vertical search
      ierr = 3;
      ynew = -1;
      newimagtol = -1;
      return;
   end
   
   if (npairs == 0)
       
       % singular value test removed all of the vertical intersection points
       iwar.sval = 1;
       
       ynew = [];
       return;
   end
   
   
   
   % organize in pairs and take midpoints
   ind = 0;
   for j=1:npairs        % already checked length(y) is even
      ylow = y(2*j-1);
      yhigh = y(2*j);
      % before taking the midpoint, if this interval is not very short,
      % check and see if ywant is in this interval, well away from the
      % end points.  If so, break this pair into two pairs, one above
      % and one below ywant, and take midpoints of both.
      inttol = .01 * (yhigh - ylow);
      if ywant > ylow + inttol & ywant < yhigh - inttol
         ind = ind + 1;
         ynew(ind,1) = (ylow + ywant)/2;
         ind = ind + 1;
         ynew(ind,1) = (ywant + yhigh)/2;
      else
         ind = ind + 1;
         ynew(ind,1) = (ylow + yhigh)/2;
      end
   end
   
   if plotfig > 0
      figure(plotfig)
      plot([x x], [max(y) min(y)], 'r-')       % plot vertical line
      plot(x*ones(length(y)), y, 'g+')          % plot intersection points   
      plot(x*ones(length(ynew)), ynew, 'bx')   % plot midpoints
   end
   
   
   % if A and B are real, discard the midpoints in the lower half plane
   if Areal
      indx = find(ynew >= 0);
      ynew = ynew(indx);
   end

end % end of else