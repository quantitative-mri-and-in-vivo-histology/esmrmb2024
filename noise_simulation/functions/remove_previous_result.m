function  remove_previous_result(path_of_script,inx_voxel,voxel_folder,index_snr,simulated_SNRs)

    directory =  [path_of_script filesep 'simulation-output' filesep 'simulation_data' filesep  'simulated_SNR_' num2str(index_snr) filesep 'noise_sample_1' filesep];

    try
        rmdir([directory 'deriva*'],"s")
    catch
      
    end
 
end