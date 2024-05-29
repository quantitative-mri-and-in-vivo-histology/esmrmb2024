%-----------------------------------------------------------------------
% Job saved on 30-Apr-2024 11:27:44 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.dti.external_choice.external_preproc_choice.mppca_call.mppca_sources = '<UNDEFINED>';
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.dummy_DKI = 1;
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.in_vols(1) = cfg_dep('mppca: MPPCA processed images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rsource'));
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.bvals_bvecs.bvals_bvecs_exp_type.bvals_exp = '<UNDEFINED>';
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.bvals_bvecs.bvals_bvecs_exp_type.bvecs_exp = '<UNDEFINED>';
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.dummy_algo.nlls.dummy_nlls = 1;
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.dummy_algo.nlls.dummy_RBC.RBC_OFF.dummy_RBC_OFF = 1;
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.dummy_algo.nlls.dummy_write_W = 1;
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.dummy_algo.nlls.n_workers = '<UNDEFINED>';
matlabbatch{2}.spm.tools.dti.fit_choice.dki_fit.mask = {''};
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.in_all(1) = cfg_dep('Diffusion Kurtosis Imaging (DKI): AD map', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','AD'));
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.in_all(2) = cfg_dep('Diffusion Kurtosis Imaging (DKI): RD map', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','RD'));
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.in_all(3) = cfg_dep('Diffusion Kurtosis Imaging (DKI): MW map', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','MW'));
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.in_all(4) = cfg_dep('Diffusion Kurtosis Imaging (DKI): AW map', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','AW'));
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.in_all(5) = cfg_dep('Diffusion Kurtosis Imaging (DKI): RW map', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','RW'));
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.dummy_convertW2K = 0;
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.mask = {''};
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.dummy_branch = 1;
matlabbatch{3}.spm.tools.dti.biophys_choice.acid_biophysical_parameters.npool = '<UNDEFINED>';
