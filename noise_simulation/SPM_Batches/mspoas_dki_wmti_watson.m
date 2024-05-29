% List of open inputs
% msPOAS: Input images - cfg_files
% msPOAS: b-values - cfg_entry
% msPOAS: b-vectors - cfg_entry
% msPOAS: Expression/Dependency - cfg_entry
% Diffusion Kurtosis Imaging (DKI): Number of workers (parallel programming) - cfg_entry
% WMTI-WATSON: Number of workers (parallel programming) - cfg_entry
nrun = X; % enter the number of runs here
jobfile = {'/Users/fricke/Documents/MATLAB/spm12/toolbox/ACID/Utilities/noise_simulation/batches/mspoas_dki_wmti_watson_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % msPOAS: Input images - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % msPOAS: b-values - cfg_entry
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % msPOAS: b-vectors - cfg_entry
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % msPOAS: Expression/Dependency - cfg_entry
    inputs{5, crun} = MATLAB_CODE_TO_FILL_INPUT; % Diffusion Kurtosis Imaging (DKI): Number of workers (parallel programming) - cfg_entry
    inputs{6, crun} = MATLAB_CODE_TO_FILL_INPUT; % WMTI-WATSON: Number of workers (parallel programming) - cfg_entry
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
