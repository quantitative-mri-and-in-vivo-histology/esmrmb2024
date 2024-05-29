function  copy_result(path_of_script,fit_methods,inx_voxel,voxel_folder,index_snr,simulated_SNRs)

    folder_1 = 'msPOAS';
    folder_2 = 'LPCA';
    folder_3 = 'MPPCA';
    folder_4 = 'noDenoising';

    directory_destination =  [path_of_script filesep 'Results_And_Figures' filesep 'Fit_Results' filesep voxel_folder{inx_voxel} filesep  'simulated_SNR_' num2str(index_snr)];
    directory_source      =  [path_of_script filesep 'simulation-output' filesep 'simulation_data' filesep 'simulated_SNR_' num2str(index_snr) filesep 'noise_sample_1' filesep];

    if fit_methods == 1
             destination = [directory_destination filesep folder_1];
             copyfile([directory_source filesep 'derivatives'], destination);
    elseif fit_methods == 2
             destination = [directory_destination filesep folder_2];
             copyfile([directory_source filesep 'derivatives'], destination);

    elseif fit_methods == 3
             destination = [directory_destination filesep folder_3];
             copyfile([directory_source filesep 'derivatives'], destination);

    elseif fit_methods == 4
             destination = [directory_destination filesep folder_4];
             copyfile([directory_source filesep 'derivatives'], destination);
    end

end