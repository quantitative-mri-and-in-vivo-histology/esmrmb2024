% List of open inputs
% Diffusion Kurtosis Imaging (DKI): Input images - cfg_files
% Diffusion Kurtosis Imaging (DKI): b-values - cfg_entry
% Diffusion Kurtosis Imaging (DKI): b-vectors - cfg_entry
% Diffusion Kurtosis Imaging (DKI): Number of workers (parallel programming) - cfg_entry
% WMTI-WATSON: Number of workers (parallel programming) - cfg_entry
nrun = X; % enter the number of runs here
jobfile = {'/Users/fricke/Documents/MATLAB/spm12/toolbox/ACID/Utilities/noise_simulation/SPM_Batches/dki_wmti_watson_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(5, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Diffusion Kurtosis Imaging (DKI): Input images - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Diffusion Kurtosis Imaging (DKI): b-values - cfg_entry
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % Diffusion Kurtosis Imaging (DKI): b-vectors - cfg_entry
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % Diffusion Kurtosis Imaging (DKI): Number of workers (parallel programming) - cfg_entry
    inputs{5, crun} = MATLAB_CODE_TO_FILL_INPUT; % WMTI-WATSON: Number of workers (parallel programming) - cfg_entry
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
