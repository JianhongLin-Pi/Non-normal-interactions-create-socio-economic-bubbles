function [slam,indx] = sortcomplex(lambda, mod)
% sort complex numbers by real part or modulus and break ties with 
% imaginary parts or angles respectively

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  PSAPSR 1.01 Copyright (C) 2011 Nicola Guglielmi, Michael Overton
%%  This program is free software: you can redistribute it and/or modify
%%  it under the terms of the GNU General Public License as published by
%%  the Free Software Foundation, either version 3 of the License, or
%%  (at your option) any later version.
%%
%%  This program is distributed in the hope that it will be useful,
%%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%  GNU General Public License for more details.
%%
%%  You should have received a copy of the GNU General Public License
%%  along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if mod
    % since "sort" sorts complex numbers by modulus, tempting to use
    % [slam,indx] = sort(lambda,'descend'); 
    % but this is a disaster if lambda is real
    [~,indx] = sort(abs(lambda),'descend'); % sort by modulus
else
    [~,indx] = sort(real(lambda),'descend'); % sort by real part
end
slam = lambda(indx);
% break ties by bubble
swapping = 1;
n = length(lambda);
% assuming the applicaton is to sort eigenvalues of dense matrices,
% the overhead for this is negligible 
while swapping % break ties with imaginary parts
    swapping = 0;
    for i=1:n-1
        if (mod & abs(slam(i)) == abs(slam(i+1)) & angle(slam(i)) < angle(slam(i+1))) | ...
         (~mod & real(slam(i)) == real(slam(i+1)) & imag(slam(i)) < imag(slam(i+1)))
            slam([i i+1]) = slam([i+1 i]);
            indx([i i+1]) = indx([i+1 i]);
            swapping = 1;
        end
    end
end
