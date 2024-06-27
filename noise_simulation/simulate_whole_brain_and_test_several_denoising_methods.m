function simulate_whole_brain_and_test_several_denoising_methods

% -------------------------------------------------------------------------
% Script for simulating a whole brain dataset with Added Noise
%
% This script performs the following steps:
% 1. Initializes paths and loads necessary files, such as tensor data, 
%    brain masks, and B0 volume.
% 2. Sets up simulation parameters, including signal-to-noise ratios (SNR)
%    and measurement protocols.
% 3. Generates synthetic DTI data by adding noise to the signals 
%    according to specified SNR values.
% 4. Saves the simulated data in a specified output directory for further
%    analysis.
% 5. Creates a graphical representation of the NRMSE for all denoised data
%    related to noise free data within the mask
%
% Instructions:
% - Ensure that paths to your data files are correctly set.
% - Adjust simulation parameters (e.g., SNR values, noise samples) as
%   needed.
% - Run the script to generate and save simulated DTI data.
%
% Prerequisites:
% - SPM (Statistical Parametric Mapping) software.
% - ACID toolbox
%
% Author: Björn Fricke
% 
% Date: 24.06.2024
%
% -------------------------------------------------------------------------




clearvars 
    
path_of_script = fileparts(mfilename('fullpath'));


%% Replace filenames with your own paths!
% In this section, you need to insert your own filenames for the required
% data files. Ensure that the paths you specify are valid and point to your
% actual data files. The filenames provided here serve as an example and
% should be replaced with your corresponding files.

load([path_of_script filesep 'tensoren-input' filesep 'pilot2_bval-bvec.mat']);

b0_vol = spm_vol([path_of_script filesep 'tensoren-input' filesep 'epilepsy_pilot_subject_2_desc-ECMOCO-HySCO-RBC-DKI-NLLS-b0.nii']);
mask_analysis = spm_vol([path_of_script filesep 'tensoren-input' filesep 'wm-mask.nii']);
masked_volume_tmp = spm_vol([path_of_script filesep 'tensoren-input' filesep 'pilot2_desc-ECMOCO-msPOAS-HySCO-BRAIN-MASK_dwi.nii']);


simulated_tensors = read_simulation_tensors([path_of_script filesep 'tensoren-input' filesep 'epilepsy_pilot_subject_2_desc-ECMOCO-HySCO-RBC-DKI-NLLS-DT_map.nii,1'], ...
    [path_of_script filesep 'tensoren-input' filesep 'epilepsy_pilot_subject_2_desc-ECMOCO-HySCO-RBC-DKI-NLLS-KT_map.nii,1']); %SIND JETZT IN ms/um²




% path_of_folder = [fullfile(path_of_script, '..', '..')];

addpath(genpath(path_of_script))

simulate_data = 1; 

b0 = acid_read_vols(b0_vol,b0_vol,1);


masked_volume = acid_read_vols(masked_volume_tmp,masked_volume_tmp,1);
% 
% load([path_of_folder filesep 'files' filesep 'whole_brain_simulation' filesep 'VG.mat'])
% load([path_of_folder filesep 'files' filesep 'whole_brain_simulation' filesep 'simulation_volume.mat'])
 VG = masked_volume_tmp;




[bval_199, bvec_199] = create_199_protocol();
bvalues_standard_protocol = bval;
%%
% pth = ['/projects/crunchie/Malte/AxDKI_Inherent_Bias_Paper/simulation/epilepsy_pilot_subject2/noise_simulation/FIT_DKI_WITHOUT_POAS/'];


outdir = [path_of_script '/simulation-output'];
 
% snrs = [100,52,30,15,5];
% snrs = [Inf];
snrs = [5,15,30,39,52,100];
npool = 8;

simulation_create_directories(outdir, 'brain-simulation', {1}, snrs)
%SNR:Veraart 2020 eLIFE, SNR = 52
%SNR:Veraart Manzanon-Patron, bioarxiv, SNR = 30,15,5
number_of_noise_samples  = 1;


simulation_parameters.simulated_SNRs = snrs;
simulation_parameters.contaminate_signal = 1;
simulation_parameters.measurement_protocol = {'standard'};
% simulation_parameters.measurement_protocol = {'standard','fast_199'};

contaminate_signal = simulation_parameters.contaminate_signal;

% load('/Users/fricke/Documents/Matlab_Stuff/ISMRM/for-upload/wm-mask.nii');


% msk_wm_tmp = spm_vol('/Users/fricke/Documents/Matlab_Stuff/ISMRM/for-upload/wm-mask.nii,1');
msk_wm = acid_read_vols(mask_analysis,mask_analysis,1);
msk_wm = msk_wm > 0;

signal_scaling_factor = mean(b0(msk_wm));

masks = create_directories_axDKI_inherent_bias_simulation(outdir, snrs, number_of_noise_samples,simulation_parameters);

name_fix = '_whole_brain_pilot2';


fit_data = false;



%% Specify values for simulation
bval = bval/1000; %already divided the bval values by 1000


[design_matrix_kurtosis_standard_protocol] = design_matrix_standardDKI(bvec,bval(1,:));
% [design_matrix_kurtosis_fast_199_protocol] = design_matrix_standardDKI(bvec_199,bval_199);

rng('default');


%% Simulation
if simulate_data == 1

    for inx_protocol = 1 : numel(simulation_parameters.measurement_protocol)
        if inx_protocol == 1
            design_matrix_kurtosis = design_matrix_kurtosis_standard_protocol;
            bvalues = bval;
            bvectors = bvec;
        elseif inx_protocol == 2
            design_matrix_kurtosis = design_matrix_kurtosis_fast_199_protocol;
            bvalues = bval_199;
            bvectors = bvec_199;
        end


        sz = [size(design_matrix_kurtosis,1) 1];
        simulated_signals = zeros([size(masked_volume), size(bvalues,2)]);

        for inx_snr = 1 : size(snrs,2)
            sigma = ( (1/(simulation_parameters.simulated_SNRs(inx_snr))) ) ;     %SNR = S0/sigma
            pd = makedist('Normal', 0, sigma);

            for inx_number_of_noise_samples = 1: number_of_noise_samples
                path_out = [outdir filesep 'simulation_data' filesep 'simulated_SNR_' num2str(simulation_parameters.simulated_SNRs(inx_snr)) filesep 'noise_sample_' num2str(inx_number_of_noise_samples)];

                for slice = 1: VG.dim(3)


                    if (simulate_data == 1)

                        voxel_position = find(masked_volume(:,:,slice) ==1);

                        for inx_voxel = 1: nnz(masked_volume(:,:,slice))

                            [x,y] = ind2sub(VG.dim(1:2),voxel_position(inx_voxel));

                            traceterm_1 = ((simulated_tensors(x,y,slice,1)+simulated_tensors(x,y,slice,2)+simulated_tensors(x,y,slice,3))/3); %for the trace term in the DKI signal equation
                            traceterm = traceterm_1.^2;

                            signal = (1/ signal_scaling_factor ) .* exp(design_matrix_kurtosis(:,1:6) * squeeze(simulated_tensors(x,y,slice,1:6)) +  traceterm.* (design_matrix_kurtosis(:,8:22) * squeeze(simulated_tensors(x,y,slice,8:22)) ) ) .* b0(x,y,slice); %b0(x,y,slice) ; % DKI-MODEL



                            if (contaminate_signal == 1)

                                real = random(pd, sz);
                                imaginary = random(pd,sz);
                                contaminated_signal = abs( ( signal ) + complex ( real , imaginary ) ) ;

                                signal = contaminated_signal;
                            end



                            simulated_signals(x,y,slice,:) = signal .* signal_scaling_factor;
                            clear signal
                        end



                    end


                end
                % The steps from hereon onwards are for writing the data into a file to be
                % able to process them further

                name_fix = '_standard_DKI';
                fname =['SNR_' num2str(snrs(:,inx_snr)) '_simulation' name_fix];
                % fname =['SNR_' num2str(simulation_parameters.simulated_SNRs(inx_snr)) '_simulation_with_' simulation_parameters.measurement_protocol{inx_protocol} '_protocol' name_fix '_noise_realisation_' num2str(inx_number_of_noise_samples)];

                VG.fname =  [path_out filesep fname '.mat']  ;
                VG.descrip = 'NIFTI-1 Image';


                for inx=1:numel(bvalues)

                    if(inx<10)
                        num = ['_00' num2str(inx)];
                    elseif(inx<100)
                        num = ['_0' num2str(inx)];
                    elseif(inx<1000)
                        num = ['_' num2str(inx)];
                    end

                    int16_my_write_vol_nii(simulated_signals(:,:,:,inx) ,VG,'' ,num) ;



                end

            end
        end

    end
end


brain_folder = {'brain'};

brain_name   = brain_folder;
% brain_folder = brain_folder;

create_directories_results(path_of_script, brain_folder, snrs)

fit_voxels(path_of_script,snrs,brain_folder,npool,bval,bvec)

% acid_rbc_simulation_plot(path_of_script,snrs,brain_name,1)
 acid_noise_simulation_plot_new(path_of_script,snrs,mask_analysis)
end