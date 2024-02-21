function [xbest, ybest, ierr] = pencil_pspa_real(A, B, epsln, y, imagtol, plotfig, xold, ...
                                        eigsolver)
% Slightly modified version of m filed by
% James Burke, Adrian Lewis, Emre Mengi and Michael Overton
% to accomodate a rectangular matrix pencils A-zB.
%
% called by pencil_pspa.m
%
% For each component in y, search for rightmost intersection between
% horizontal line with given y component and the pseudospectrum.
% Return the best x value and a corresponding y value.
% Input parameter xold is used only for plotting, if plotfig > 0

[m,n] = size(A);
ierr = 0;

for j=1:length(y)
   B2 = A - y(j)*1i*B;

   % use built-in eig of matlab to compute Hamiltonian eigenvalues
   if eigsolver == 0       
     % CHANGED: Matrix to accomodate rectangular pencil.
       eM2 = eig([1i*B2' epsln*eye(n); -epsln*eye(m)   1i*B2], blkdiag(B',B) );  
   else
       error('Functionality not implemented.');
   end
   
   % Filter out the infinite eigenvalues
   eM2 = eM2(isfinite(eM2));

   if min(abs(real(eM2))) <= imagtol % check if M2 has an imaginary eigenvalue
      indx = find(abs(real(eM2)) <= imagtol);  % extract such eigenvalues
      xnew(j) = max(imag(eM2(indx)));
      
      if plotfig > 0
          figure(plotfig)
          plot([xold xnew(j)], [y(j) y(j)], 'm-')  % plot horizontal line
          plot(xnew(j), y(j), 'b+')       % plot right end point
      
          if isreal(A)
              plot([xold xnew(j)], -[y(j) y(j)], 'm-')  % plot horizontal line
              plot(xnew(j), -y(j), 'b+')    % plot right end point
          end
      end
      
      
   else
       % Normally horizontal search should return an intersection point
       % for each midpoint, however because of rounding errors it failed
       % to do so.       
       xnew(j) = -inf;
   end % end of else
   
end % end of for

if ~isfinite(max(xnew))

    % The horizontal searches failed.
    ierr = 4;
    xbest = -1;
    ybest = -1;
    return;
end

[xbest,ind] = max(xnew);     % furthest to right, returns 1 index
ybest = y(ind);              % corresponding y value

% mark the rightmost intersection point
if plotfig > 0 & xbest > xold
   plot(xbest, ybest, 'b*')
end

return;