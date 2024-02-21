function [converged, out] = check_convergence(z, z_old, out, opts, err_pspa)
% Private function to check whether the subspace algorithm has converged.

% z is the current approximation iterate in the complex plane
%   real(z) is the approximation to pencil_pspa
% z_old is the previous one


converged = false;
cur_iter = length(out.z_pspa);

F = real(z); F_old = real(z_old);


%%% Check output of pencil_pspa. If there is an error, we stop.
if err_pspa==1 || err_pspa==3 || err_pspa==4
  if opts.prntlvl>=1
    fprintf('-- Function pencil_pspsa returned error %i. Exiting. \n', out.ierr_pspa)      
  end
  out.succ = false;
  out.stop_msg = 'pencil_pspa returned an error.';
  out.its = cur_iter;
  converged = true;   
  return
end

%%% Test for stagnation  .
if cur_iter>1
  rel_change = abs(F_old - F)/max(1,abs(F_old));
  if opts.prntlvl>=2
    fprintf('Iteration %2i. Current = %18.15e. Relative change = %8.2e. \n',cur_iter,F,rel_change)
  end
  
  if rel_change < opts.ftol
    out.succ = true;
    out.its = cur_iter;
    converged = true;
    out.stop_msg = 'Tolerance on relative change of approximation satisfied.';
    if opts.prntlvl>=1
      fprintf('-- Tolerance on relative change satisfied at iteration %2i. Current = %18.15e. \n',cur_iter,F)
    end
    return
  end
else
  if opts.prntlvl>=2
    fprintf('Iteration %2i. Current = %18.15e. \n',cur_iter,F)
  end
end
  


%%% Check monotonicity of pspa of pencil.
% It should not become nonmonotonic in theory. So this indicates
% stagnation or an error if pencil_pspa did not complain.
if real(z) - real(z_old) <= 0 % this captures out.ierr_pspa==2 too since then we have ==  
  if err_pspa==0 %pencil_pspa claimed it succeeded, so something must be wrong!      
      out.succ = true;
      out.stop_msg = 'Approximation stagnated numerically. However pencil_pspa claims it succeeded.';
      out.its = cur_iter;
      converged = true;      
  else
    out.succ = true;
    out.stop_msg = 'Approximation stagnated numerically.';
    out.its = cur_iter;
    converged = true;
  end
  if opts.prntlvl>=1
    fprintf('-- Iteration %2i stagnated. Current = %18.15e. \n',cur_iter,F)
  end
  return
end


%%% Calculate exact error (if possible)
if isfinite(opts.exact)
  abs_err = abs(F-opts.exact);
  rel_err = abs_err / abs(opts.exact) / opts.normA;
  if opts.prntlvl>=2
    fprintf('              Absolute error = %8.2e.  Relative error = %8.2e. \n', ...
      abs_err, rel_err )
  end
end

