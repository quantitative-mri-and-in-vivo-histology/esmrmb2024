function masks = create_directories_axDKI_inherent_bias_simulation(outdir, snrs, number_of_noise_samples,simulation_parameters)

% masks = {'WM_Westin', 'WM', 'WM_Westin_FA', 'WM_FA'};
masks = {'INVERSE_WM_Westin'};
  
folder_simulation_data = [outdir filesep 'simulation_data' ];

if ~exist(folder_simulation_data,'dir')
  status = mkdir(folder_simulation_data);
end
            

for inx_snr = 1 : size(snrs,2)
    folder_snr = [folder_simulation_data filesep 'simulated_SNR_' num2str(snrs(inx_snr))];
      if ~exist(folder_snr,'dir')
        status = mkdir(folder_snr);
      end

      for inx_number_of_noise_samples = 1: number_of_noise_samples

          folder_noise_sample = [folder_snr filesep 'noise_sample_' num2str(inx_number_of_noise_samples)];
          if ~exist(folder_noise_sample,'dir')
            status = mkdir(folder_noise_sample);
          end

            for inx_masks = 1: numel(masks)
                
                folder_masks = [folder_noise_sample filesep masks{inx_masks}];

                if ~exist(folder_masks,'dir')
                    status = mkdir(folder_masks);
                end


                for inx_protocol = 1 : numel(simulation_parameters.measurement_protocol)
                    folder_protocol = [folder_masks filesep simulation_parameters.measurement_protocol{inx_protocol}];
                   if ~exist(folder_protocol,'dir')
                      status = mkdir(folder_protocol);
                   end
                end



            end

      end

      
end







