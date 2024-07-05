function acid_noise_simulation_barplot_new(path_of_script,SNRlist,mask)


DKI_Variables ={'AD','RD','MW','AW','RW'};


% mask =  '/Users/fricke/Documents/ISMRM-2023/wm-mask.nii';

struct_mask = spm_vol(mask);

matrix_mask = acid_read_vols(struct_mask,struct_mask,1);

MSK_idx = find(matrix_mask>10^-3);






for i = 1:5
        if i == 1
            figure('DefaultAxesFontSize',25);
            subplot(1,5,i)
            hold on
            set(gcf, 'Position',  [0, 100, 3634, 1024])
            set(gca,'units','centimeters')
            pos = get(gca,'Position');
            ti = get(gca,'TightInset');
        else
            subplot(1,5,i)
            hold on
            set(gcf, 'Position',  [0, 100, 3634, 1024])
            set(gca,'units','centimeters')
            pos = get(gca,'Position');
            ti = get(gca,'TightInset');
        end
    for k = 1:size(SNRlist,2)

        SNR = SNRlist(:,k);

        % load([path_of_script filesep 'Datasets' filesep 'GroundTruth' filesep 'GT_Table.mat']);
        % 
        % y = table2array(GT_Table(voxel_inx,:));


        % data1 = [ path_of_script '/Results_And_Figures/Fit_Results/voxels/' Voxel '/simulated_SNR_' num2str(SNR) '/standardDKI/DKI-NLLS/SNR_' num2str(SNR) '_simulation_standard_DKI_001_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no RBC DKI
        % data2 = [ path_of_script '/Results_And_Figures/Fit_Results/voxels/' Voxel '/simulated_SNR_' num2str(SNR) '/standardDKI_RBC/DKI-NLLS-RBC/SNR_' num2str(SNR) '_simulation_standard_DKI_001_desc-DKI-NLLS-RBC-' DKI_Variables{i} '_map.nii']; % DKI-RBC
        % data3 = [ path_of_script '/Results_And_Figures/Fit_Results/voxels/' Voxel '/simulated_SNR_' num2str(SNR) '/RBC-module-old/DKI-NLLS/SNR_' num2str(SNR) '_simulation_standard_DKI_001_desc-RBC-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % RBC old
        % data4 = [ path_of_script '/Results_And_Figures/Fit_Results/voxels/' Voxel '/simulated_SNR_' num2str(SNR) '/RBC-module-full/DKI-NLLS/SNR_' num2str(SNR) '_simulation_standard_DKI_001_desc-RBC-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % full new
        % data5 = [ path_of_script '/Results_And_Figures/Fit_Results/voxels/' Voxel '/simulated_SNR_' num2str(SNR) '/RBC-module-koaya/DKI-NLLS/4D_db_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % koaya
        data0 = ['/Users/fricke/Documents/ismrm-2023/GT/derivatives/DKI-NLLS/SNR-Inf-4D_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % GT
        dataX_mspoas = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(SNR) filesep 'msPOAS' filesep 'DKI-NLLS' filesep 'SNR_' num2str(SNR) '_simulation_standard_DKI_001_desc-msPOAS-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no RBC POAS
        dataX__lpca  = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(SNR) filesep 'LPCA' filesep 'DKI-NLLS' filesep '4D-raw_desc-LPCA-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % LPCA
        dataX__mppca = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(SNR) filesep 'MPPCA' filesep 'DKI-NLLS' filesep '4D-MPPCA_desc-MPPCA-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % MPPCA
        dataX_nodenoising = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(SNR) filesep 'noDenoising' filesep 'DKI-NLLS' filesep 'SNR_' num2str(SNR) '_simulation_standard_DKI_001_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no denoising
        struct0 = spm_vol(data0);
        dm0 = [struct0(1).dim, size(struct0,1)];
        matrix0 = zeros(dm0);
        for n = 1:dm0(4)
            matrix0(:,:,:,n) = acid_read_vols(struct0(n),struct0(1),1);
        end
        
        Y = matrix0(MSK_idx)';
        
        
        struct1 = spm_vol(dataX_mspoas);
        struct2 = spm_vol(dataX__lpca);
        struct3 = spm_vol(dataX__mppca);
        struct4 = spm_vol(dataX_nodenoising);
        % struct5 = spm_vol(data5);

        
        dm1 = [struct1(1).dim, size(struct1,1)];
        dm2 = [struct2(1).dim, size(struct2,1)];
        dm3 = [struct3(1).dim, size(struct3,1)];
        dm4 = [struct4(1).dim, size(struct4,1)];
        % dm5 = [struct5(1).dim, size(struct5,1)];

        matrix1 = zeros(dm1);
        for n = 1:dm1(4)
        matrix1(:,:,:,n) = acid_read_vols(struct1(n),struct1(1),1);
        end
        
        matrix2 = zeros(dm2);
        for n = 1:dm2(4)
        matrix2(:,:,:,n) = acid_read_vols(struct2(n),struct2(1),1);
        end
        
        matrix3 = zeros(dm3);
        for n = 1:dm3(4)
        matrix3(:,:,:,n) = acid_read_vols(struct3(n),struct3(1),1);
        end
        
        matrix4 = zeros(dm4);
        for n = 1:dm4(4)
        matrix4(:,:,:,n) = acid_read_vols(struct4(n),struct4(1),1);
        end
        % 
        % matrix5 = zeros(dm5);
        % for n = 1:dm5(4)
        % matrix5(:,:,:,n) = acid_read_vols(struct5(n),struct5(1),1);
        % end 


        matrix_all = [reshape(matrix1(2,:,2), [], 1), reshape(matrix2(2,:,2), [], 1), reshape(matrix3(2,:,2), [], 1), reshape(matrix4(2,:,2), [], 1)];

        % for j=1:3
        %      mean_all(:,j) = median(matrix_all(:,j));
        %      std_all(:,j)  = std(matrix_all(:,j));     
        % end



        % SNR X
        Y_hat_all(:,1) = matrix1(MSK_idx)';
        Y_hat_all(:,2) = matrix2(MSK_idx)';
        Y_hat_all(:,3) = matrix3(MSK_idx)';
        Y_hat_all(:,4) = matrix4(MSK_idx)';


            

        for p = 1:4
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            nrmse_mean(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean(:,p) = mbe / mean(Y,'all',"omitnan");
        end

        
        relative_poas_deoising(:,k) = (nrmse_mean(:,1)-nrmse_mean(:,4))./nrmse_mean(:,4);
        relative_lpca_deoising(:,k) = (nrmse_mean(:,2)-nrmse_mean(:,4))./nrmse_mean(:,4);
        relative_mppca_deoising(:,k) = (nrmse_mean(:,3)-nrmse_mean(:,4))./nrmse_mean(:,4);



        % mean_complete_1(k) = mean_all(:,1);
        % mean_complete_2(k) = mean_all(:,2);

        % if i == 1 || i == 2
        %     mean_complete_1(k) = mean_all(:,1) * 1000;
        %     mean_complete_2(k) = mean_all(:,2) * 1000;
        %     mean_complete_3(k) = mean_all(:,3) * 1000;
        %     mean_complete_4(k) = mean_all(:,4) * 1000;
        %     mean_complete_5(k) = mean_all(:,5) * 1000;
        % else
        %     mean_complete_1(k) = mean_all(:,1);
        %     mean_complete_2(k) = mean_all(:,2);
        %     mean_complete_3(k) = mean_all(:,3);
        %     mean_complete_4(k) = mean_all(:,4);
        %     mean_complete_5(k) = mean_all(:,5);
        % end

        nrmse_complete_1(k) = nrmse_mean(:,1);
        nrmse_complete_2(k) = nrmse_mean(:,2);
        nrmse_complete_3(k) = nrmse_mean(:,3);
        nrmse_complete_4(k) = nrmse_mean(:,4);

        nmbe_complete_1(k) = nmbe_mean(:,1);
        nmbe_complete_2(k) = nmbe_mean(:,2);
        nmbe_complete_3(k) = nmbe_mean(:,3);




    end


        for h = 1:6
            mean_relative_mppca_deoising(:,h) = mean(relative_mppca_deoising(isfinite(relative_mppca_deoising(:,h)),h).','all',"omitnan")*100;
            std_relative_mppca_deoising(:,h) = std(relative_mppca_deoising(isfinite(relative_mppca_deoising(:,h)),h).');
        end

        for h = 1:6
            mean_relative_poas_deoising(:,h) = mean(relative_poas_deoising(isfinite(relative_poas_deoising(:,h)),h).','all',"omitnan")*100;
            std_relative_poas_deoising(:,h) = std(relative_poas_deoising(isfinite(relative_poas_deoising(:,h)),h).');
        end

        for h = 1:6
            mean_relative_lpca_deoising(:,h) = mean(relative_lpca_deoising(isfinite(relative_lpca_deoising(:,h)),h).','all',"omitnan")*100;
            std_relative_lpca_deoising(:,h) = std(relative_lpca_deoising(isfinite(relative_lpca_deoising(:,h)),h).');
        end



        SNRlist = [5,15,30,39,52,100];

        data_barplot    = [mean_relative_poas_deoising(:,1), mean_relative_lpca_deoising(:,1), mean_relative_mppca_deoising(:,1); mean_relative_poas_deoising(:,2), mean_relative_lpca_deoising(:,2), mean_relative_mppca_deoising(:,2);mean_relative_poas_deoising(:,3), mean_relative_lpca_deoising(:,3), mean_relative_mppca_deoising(:,3);mean_relative_poas_deoising(:,4), mean_relative_lpca_deoising(:,4), mean_relative_mppca_deoising(:,4);mean_relative_poas_deoising(:,5), mean_relative_lpca_deoising(:,5), mean_relative_mppca_deoising(:,5);mean_relative_poas_deoising(:,6), mean_relative_lpca_deoising(:,6), mean_relative_mppca_deoising(:,6)];

        b = bar(SNRlist,data_barplot);

        legend('msPOAS','LPCA','MP-PCA')

        b(1).FaceColor = 'r';
        b(2).FaceColor = 'b';
        b(3).FaceColor = 'g';


        title([DKI_Variables{i}])


        xlim([(SNRlist(1,1)-5) (SNRlist(1,end)+5)])



        % ylim([-70 70])
        if i == 1
            ylim([-10 350])

        elseif i == 2
            ylim([-50 200])
        elseif i == 3
            ylim([-40 300])
        elseif i == 4
            ylim([-60 80])
        elseif i == 5
            ylim([-30 70])
        end

        xticks([5 15 30 39 52 100])
        xlabel('SNR')
        ylabel('Relative difference to no denoising [%]')




        % line([(SNRlist(1,1)-5) (SNRlist(1,end)+5)], [y(i) y(i)], 'Color', '#A2142F', 'LineStyle', '--'); hold on;


        % plot(SNRlist,nrmse_complete_1,"ro", 'LineStyle', '-','LineWidth',4); hold on; % no RBC POAS
        % plot(SNRlist,nrmse_complete_2,"b*", 'LineStyle', '-','LineWidth',4); hold on; % no RBC LPCA
        % plot(SNRlist,nrmse_complete_3,"g+", 'LineStyle', '-','LineWidth',4); hold on; % no RBC MP-PCA
        % plot(SNRlist,nrmse_complete_4,"k+", 'LineStyle', '-','LineWidth',4); hold on; % no denosing
        % % plot(SNRlist,(y(i) + (y(i)-mean_complete_1)),"ro", 'LineStyle', '-'); hold on;
        % % plot(SNRlist,(y(i) - (y(i)-mean_complete_1)),"ro", 'LineStyle', '-');
        % % plot(SNRlist,mean_complete_2,"g+", 'LineStyle', '--'); hold on;
        % % plot(SNRlist,mean_complete_3,"b*", 'LineStyle', '--'); hold on;
        % % plot(SNRlist,mean_complete_4,"cx", 'LineStyle', '--'); hold on;
        % % plot(SNRlist,mean_complete_5,"m-", 'LineStyle', '--'); hold on;
        % 
        % legend('msPOAS','LPCA','MPPCA', 'no dneoising')
        % 
        % xlim([5 110])
        % ylim([0 1])
        % xlabel('SNR')
        % ylabel('NRMSE (no unit)')
end