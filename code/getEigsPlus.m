function fn = getEigsPlus(use_modified)
%getEigsPlus returns a function handle to a modified version of the sparse 
%eigenvalue routine eigs.m with enhanced functionality.
%
%    author: Tim Mitchell
%    email: tim.mitchell@cims.nyu.edu
%    revision date: Nov. 6th, 2013
%
%getEigsPlus supports multiple releases of Matlab up to R2013b and defaults
%to regular eigs.m on newer releases without the expanded eigplus 
%functionality, except that the typical eigs.m output arguments [d], [V,D], 
%and [V,D,flag] are resized to the number of eigenpairs converged and 
%the eigenvalues are always returned as a vector, that is, V and D are 
%returned formatted as they are by eigsplus, not eigs.m, to ensure 
%compatibility and preference of using eigsplus.  When eigsplus resorts 
%to using defaulf eigs.m, the standard flag instead of ARPACK iters is 
%returned, even though it is redundant since the size of V and d will 
%relate this information.
%
%Note 1: The modified eigsplus version of R2013b may be forced to be used 
%on later releases of Matlab by calling getEigsPlus(true) but it may not 
%be compatible.  
%
%Note 2: If you're using R2012a or earlier, don't!  R2012a and earlier 
%releases contain an ARPACK bug (discovered and fixed by Tim Mitchell)
%where incorrect eigenpairs (i.e. not even valid eigenpairs) may be 
%returned if not all eigenpairs converge.  R2012b and later releases 
%contain the patch out of the box so consider upgrading. More brave and/or 
%frugal users may consider replacing Matlab's ARPACK binary with their own 
%compiled version with my patch available at:
%    http://www.cims.nyu.edu/~tmitchel/software/
% 
% EXAMPLE USAGE:
% > eigsplus_fn = getEigsPlus():
% > [V,d,iters] = eigsplus_fn(A,k,'LR',opts);
%
% eigsplus_fn supports the same input arguments as eigs with slightly
% different output arguments.
%
% FORCE USE OF R2013b-BASED EIGSPLUS ON NEWER THAN R2013b RELEASES: 
% > eigsplus_fn = getEigsPlus(true);
% >
% > % On newer than R2013b releases, getEigsPlus() would have returned
% > % eigsplus_fn which calls eigs underneath but formats like eigsplus:
% > [V,d,flag] = eigsplus_fn(A,k,'LR',opts);  
%
% The eigsplus_fn function handle should either be passed to as an argument
% to whatever function where it is needed, shared by nesting functions, 
% or by cunning use of a global variable such as:
%
% m-file #1 for initialization:
% global eigsplus_fn;
% eigsplus_fn = getEigsPlus();
%
% m-file #2 where eigsplus_fn is needed;
% global eigsplus_fn;
% [V,d,iters] = eigsplus_fn(A,k,'LR',opts);
%
% Calling getEigsPlus() more than once is not recommended since it is 
% inefficient to repeatedly check the Matlab version, possibly warn the 
% user, and set up the corresponding correct function handle for the user.
% 
% eigsplus_fn provides the following functionality beyond eigs.m:
%
% 1) no need to ever worry about mistaking zeros in representing
%    unconverged eigenvalues in d or D as actual eigenvalues!  R2013b and
%    later releases use NaNs (based off of eigsplus) so this particular 
%    functionality is mostly for users on earlier Matlab releases.  
%    However, the output formatting of eigsplus_fn described below may be 
%    preferred over eigs.m anyway. 
%
% 2) output argument reformatting and ARPACK iters info
%    > d = eigsplus_fn(A,k)
%    > [V,d] = eigsplus_fn(A,k)
%    > [V,d,iters] = eigsplus_fn(A,k)
%
%    d is always a vector, unlike [V,D] = eigs() where D is a diagaonl
%    matrix
% 
%    V and d are resized to the number of converged eigenvalues "nconv."
%    Thus, V and d may be empty arrays if no eigenvalues converge or
%    [nconv,1] = size(d) and [n,nconv] = size(V) where n is the length(A) 
%    and 1 <= nconv <= k.
% 
%    The third output argument returns the number of ARPACK iterations 
%    incurred.  Flag is no longer returned (except when defaulting to 
%    eigs.m on a newer than R2013b releases) but the user can
%    examine the size of d to see if not all requested eigenvalues
%    converged.
%
% 3) a warning is thrown instead of an error when none of the eigenvalues
%    converge. Empty arrays are returned for d and V.
%
% 4) opts.isreal may be set to false to force the complex solver if A is 
%    real and opts.v0 is real or if A is real and opts.v0 is complex.  
%    eigs throws an error in either of these cases.  eigsplus_fn will 
%    similarly throw an error in either of these cases if opts.isreal is 
%    either not provided or is set to true.
%
% The main motivation for eigsplus is when the user may unknowingly get 
% and subsequently use a zero as an eigenvalue when in fact, that zero was 
% merely padding in the case that not all of the requested eigenvalues 
% converged.  This problem occcurs on all pre-R2013b releases of Matlab.  
% For example, with the standard R2012b release of eigs, if the user wants 
% the largest real part eigenvalue, he may write the following:
%
% largest_real_part_eval = max(real(eigs(A,k,'LR')));
% 
% but if not all k eigenvalues converged, max(real()) may erroneously and
% SILENTLY return the value 0 as an eigenvalue. As noted, this is now fixed
% in R2013b but the additional enhancements and output formatting of
% eigsplus may still be desired by users.  Furthermore, eigsplus provides a
% framework for adding additional functionality and modifications to eigs
% if needed in the future.
%
% END of getEigsPlus help comments

    % Get version as string in 20XX[a|b] format, e.g. "2013b"
    v = version('-release');
    
    % convert version to numerical value
    % XXXXa will be XXXX.0 
    % XXXXb will be XXXX.5
    b = 0;
    if v(end) == 'b'
        b = 0.5;
    end
    ver_n = str2double(v(1:end-1));
    ver_n = ver_n + b;
    
    if ver_n < 2012.5
        % warn user that pre-R2012b Matlab releases have an ARPACK bug
        % where incorrect eigenpairs may be returned (bug discovered and
        % fixed by Tim Mitchell)
        % Force display of warning to user, in case they have warning off
        w_id = 'getEigsPlus:ARPACK_bug';
        warning('on',w_id);
        w_msg = ['EIGS may sometimes return incorrect eigenpairs due ' ...
                 'to ARPACK bug existing in all pre-R2012b Matlab ' ...
                 'releases.  You should use R2012b or later!'];
        warning(w_id,w_msg);
    end

    % select different versions of modified EIGS for different releases
    % eigsR2012b.m and eigs2013a.m versions replace zero padding with 
    % NaN padding for unconverged eigenvalues and eigenvectors
    % R2013b eigs.m uses NaN padding out of the box but eigsR2013b adds the
    % additional eigsplus modifications.
    if ver_n < 2013
        % use our original modified eigs version
        eigs_fn = @eigsR2012b;
    elseif ver_n == 2013.0
        % use specific modified eigs version since R2013a changed the
        % binary interface to ARPACK so earlier versions of eigs don't work
        eigs_fn = @eigsR2013a;
    elseif ver_n == 2013.5 || (nargin == 1 && use_modified)
        % use R2013b with modifications
        % may be incompatible if Matlab release is newer than R2013b
        eigs_fn = @eigsR2013b;
    else
        % use current Matlab version by default, in case later releases 
        % aren't compatible with eigsR2013b.m.  Warn user that some
        % eigsplus functionality may be disabled.
        w_id = 'getEigsPlus:MatlabReleaseIsNewer';
        w_msg = ['EIGSPLUS: default eigs.m is being used; some '...
                 'eigsplus functionality may be disabled!  You may ' ...
                 'try calling getEigsPlus(true) to force the most ' ...
                 'recent modified eigsR0XXX.m to be used but it may ' ...
                 'not be compatible with your current version of Matlab.'];
        %warning('on',w_id);
        %warning(w_id,w_msg);
        eigs_fn = @eigs;
    end
    
    fn = @wrapper;

    % Calls the version specific eigsR20XXX.m (or default eigs.m) file 
    % Processes output arguments to eigsplus standard
    function varargout = wrapper(varargin)
        if ~nargout
            % don't suppress output to console (hence no semi-colon)
            processOutArgs(eigs_fn(varargin{:}))
        else
            [varargout{1:nargout}] = eigs_fn(varargin{:}); 
            [varargout{1:nargout}] = processOutArgs(varargout{:});
        end    
    end
end

function varargout = processOutArgs(varargin)
    % 1) given [V,D] output args: converts diagonal matrix D to vector d
    % 2) trims NaNs out of [V,D] or d, leaving only converged eigenpairs
    % 3) third argument, if present, is passed as is, all others ignored
    n_args = length(varargin);
    if n_args == 1 
        varargout{1} = varargin{1}(~isnan(varargin{1}));
    else
        evals_vector = diag(varargin{2});
        convergedIndices = ~isnan(evals_vector);
        varargout{2} = evals_vector(convergedIndices);
        varargout{1} = varargin{1}(:,convergedIndices); 
        if n_args == 3
            varargout{3} = varargin{3};
        end
    end
end