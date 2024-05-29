function acid_noise_simulation_plot
for b = 1:2 %NRMSE and NRMBE
% for j = 1:1

path_of_script = fileparts(mfilename('fullpath'));

    % SNR_Variables ={'5','15','30','52','100'};

DKI_Variables ={'RD','AD','RW','AW','MW'};

SNRS = {39,101};


    for i = 1:5
        % i = 1;
        if i == 1
            figure('DefaultAxesFontSize',45);
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
        % for k = 1:size(SNRlist,2)

        % SNR = SNRlist(:,k);

        % load([path_of_script filesep 'Datasets' filesep 'GroundTruth' filesep 'GT_Table.mat']);

        % y = table2array(GT_Table(voxel_inx,:));
            data0 = ['/Users/fricke/Documents/ISMRM-2023/GT/derivatives/DKI-NLLS/SNR-Inf-4D_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % GT
    
            
            % SNR X
            dataX_mspoas = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(i) filesep 'msPOAS' filesep 'DKI-NLLS' filesep 'SNR_' num2str(SNRS(i)) 'simulation_standard_DKI_001_desc-msPOAS-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no RBC POAS
            dataX__lpca  = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(i) filesep 'LPCA' filesep 'DKI-NLLS' filesep 'SNR_' num2str(SNRS(i)) 'simulation_standard_DKI_001_desc-LPCA-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % LPCA
            dataX__mppca = [path_of_script filesep 'Results_and_Figures' filesep 'Fit_Results' filesep 'brain' filesep 'simulated_SNR_' num2str(i) filesep 'MPPCA' filesep 'DKI-NLLS' filesep 'SNR_' num2str(SNRS(i)) 'simulation_standard_DKI_001_desc-MPPCA-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % MPPCA
            
            
            
            data2_5 = ['/Users/fricke/Documents/ISMRM-2023/LPCA/derivatives/DKI-NLLS/SNR-5-4D-LPCA_denoised_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no RBC LPCA
            data3_5 = ['/Users/fricke/Documents/ISMRM-2023/MP-PCA/derivatives/DKI-NLLS/SNR-5-4D-MP-PCA-denoised_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no RBC MPPCA
            data7_5 = ['/Users/fricke/Documents/ISMRM-2023/no-denoising/derivatives/DKI-NLLS/SNR-5-4D_desc-DKI-NLLS-' DKI_Variables{i} '_map.nii']; % no denoising
    



        mask =  '/Users/fricke/Documents/ISMRM-2023/wm-mask.nii';

        struct_mask = spm_vol(mask);

        matrix_mask = acid_read_vols(struct_mask,struct_mask,1);

        MSK_idx = find(matrix_mask>10^-3);

        struct0 = spm_vol(data0);


        % SNR 5
        struct1_5 = spm_vol(data1_5);
        struct2_5 = spm_vol(data2_5);
        struct3_5 = spm_vol(data3_5);
        struct4_5 = spm_vol(data4_5);
        struct5_5 = spm_vol(data5_5);
        struct6_5 = spm_vol(data6_5);
        struct7_5 = spm_vol(data7_5);

        % SNR 15
        struct1_15 = spm_vol(data1_15);
        struct2_15 = spm_vol(data2_15);
        struct3_15 = spm_vol(data3_15);
        struct4_15 = spm_vol(data4_15);
        struct5_15 = spm_vol(data5_15);
        struct6_15 = spm_vol(data6_15);
        struct7_15 = spm_vol(data7_15);

        % SNR 30
        struct1_30 = spm_vol(data1_30);
        struct2_30 = spm_vol(data2_30);
        struct3_30 = spm_vol(data3_30);
        struct4_30 = spm_vol(data4_30);
        struct5_30 = spm_vol(data5_30);
        struct6_30 = spm_vol(data6_30);
        struct7_30 = spm_vol(data7_30);

        % SNR 39
        struct1_39 = spm_vol(data1_39);
        struct2_39 = spm_vol(data2_39);
        struct3_39 = spm_vol(data3_39);
        struct4_39 = spm_vol(data4_39);
        struct5_39 = spm_vol(data5_39);
        struct6_39 = spm_vol(data6_39);
        struct7_39 = spm_vol(data7_39);

        % SNR 52
        struct1_52 = spm_vol(data1_52);
        struct2_52 = spm_vol(data2_52);
        struct3_52 = spm_vol(data3_52);
        struct4_52 = spm_vol(data4_52);
        struct5_52 = spm_vol(data5_52);
        struct6_52 = spm_vol(data6_52);
        struct7_52 = spm_vol(data7_52);

        % SNR 100
        struct1_100 = spm_vol(data1_100);
        struct2_100 = spm_vol(data2_100);
        struct3_100 = spm_vol(data3_100);
        struct4_100 = spm_vol(data4_100);
        struct5_100 = spm_vol(data5_100);
        struct6_100 = spm_vol(data6_100);
        struct7_100 = spm_vol(data7_100);



        dm0 = [struct1_5(1).dim, size(struct1_5,1)];
        dm1 = [struct1_5(1).dim, size(struct1_5,1)];
        dm2 = [struct2_5(1).dim, size(struct2_5,1)];
        dm3 = [struct3_5(1).dim, size(struct3_5,1)];
        dm4 = [struct4_5(1).dim, size(struct4_5,1)];
        dm5 = [struct5_5(1).dim, size(struct5_5,1)];
        dm6 = [struct6_5(1).dim, size(struct6_5,1)];
        dm7 = [struct7_5(1).dim, size(struct7_5,1)];



        matrix0 = zeros(dm0);
        for n = 1:dm0(4)
            matrix0(:,:,:,n) = acid_read_vols(struct0(n),struct0(1),1);
        end

        % SNR 5
        matrix1_5 = zeros(dm1);
        for n = 1:dm1(4)
            matrix1_5(:,:,:,n) = acid_read_vols(struct1_5(n),struct1_5(1),1);
        end

        matrix2_5 = zeros(dm2);
        for n = 1:dm2(4)
            matrix2_5(:,:,:,n) = acid_read_vols(struct2_5(n),struct2_5(1),1);
        end

        matrix3_5 = zeros(dm3);
        for n = 1:dm3(4)
            matrix3_5(:,:,:,n) = acid_read_vols(struct3_5(n),struct3_5(1),1);
        end

        matrix4_5 = zeros(dm4);
        for n = 1:dm4(4)
            matrix4_5(:,:,:,n) = acid_read_vols(struct4_5(n),struct4_5(1),1);
        end

        matrix5_5 = zeros(dm5);
        for n = 1:dm5(4)
            matrix5_5(:,:,:,n) = acid_read_vols(struct5_5(n),struct5_5(1),1);
        end

        matrix6_5 = zeros(dm6);
        for n = 1:dm6(4)
            matrix6_5(:,:,:,n) = acid_read_vols(struct6_5(n),struct6_5(1),1);
        end

        matrix7_5 = zeros(dm6);
        for n = 1:dm6(4)
            matrix7_5(:,:,:,n) = acid_read_vols(struct7_5(n),struct7_5(1),1);
        end

        % SNR 15
        matrix1_15 = zeros(dm1);
        for n = 1:dm1(4)
            matrix1_15(:,:,:,n) = acid_read_vols(struct1_15(n),struct1_15(1),1);
        end

        matrix2_15 = zeros(dm2);
        for n = 1:dm2(4)
            matrix2_15(:,:,:,n) = acid_read_vols(struct2_15(n),struct2_15(1),1);
        end

        matrix3_15 = zeros(dm3);
        for n = 1:dm3(4)
            matrix3_15(:,:,:,n) = acid_read_vols(struct3_15(n),struct3_15(1),1);
        end

        matrix4_15 = zeros(dm4);
        for n = 1:dm4(4)
            matrix4_15(:,:,:,n) = acid_read_vols(struct4_15(n),struct4_15(1),1);
        end

        matrix5_15 = zeros(dm5);
        for n = 1:dm5(4)
            matrix5_15(:,:,:,n) = acid_read_vols(struct5_15(n),struct5_15(1),1);
        end

        matrix6_15 = zeros(dm6);
        for n = 1:dm6(4)
            matrix6_15(:,:,:,n) = acid_read_vols(struct6_15(n),struct6_15(1),1);
        end

        matrix7_15 = zeros(dm6);
        for n = 1:dm6(4)
            matrix7_15(:,:,:,n) = acid_read_vols(struct7_15(n),struct7_15(1),1);
        end

        % SNR 30
        matrix1_30 = zeros(dm1);
        for n = 1:dm1(4)
            matrix1_30(:,:,:,n) = acid_read_vols(struct1_30(n),struct1_30(1),1);
        end

        matrix2_30 = zeros(dm2);
        for n = 1:dm2(4)
            matrix2_30(:,:,:,n) = acid_read_vols(struct2_30(n),struct2_30(1),1);
        end

        matrix3_30 = zeros(dm3);
        for n = 1:dm3(4)
            matrix3_30(:,:,:,n) = acid_read_vols(struct3_30(n),struct3_30(1),1);
        end

        matrix4_30 = zeros(dm4);
        for n = 1:dm4(4)
            matrix4_30(:,:,:,n) = acid_read_vols(struct4_30(n),struct4_30(1),1);
        end

        matrix5_30 = zeros(dm5);
        for n = 1:dm5(4)
            matrix5_30(:,:,:,n) = acid_read_vols(struct5_30(n),struct5_30(1),1);
        end

        matrix6_30 = zeros(dm6);
        for n = 1:dm6(4)
            matrix6_30(:,:,:,n) = acid_read_vols(struct6_30(n),struct6_30(1),1);
        end

        matrix7_30 = zeros(dm6);
        for n = 1:dm6(4)
            matrix7_30(:,:,:,n) = acid_read_vols(struct7_30(n),struct7_30(1),1);
        end

        % SNR 39
        matrix1_39 = zeros(dm1);
        for n = 1:dm1(4)
            matrix1_39(:,:,:,n) = acid_read_vols(struct1_39(n),struct1_39(1),1);
        end

        matrix2_39 = zeros(dm2);
        for n = 1:dm2(4)
            matrix2_39(:,:,:,n) = acid_read_vols(struct2_39(n),struct2_39(1),1);
        end

        matrix3_39 = zeros(dm3);
        for n = 1:dm3(4)
            matrix3_39(:,:,:,n) = acid_read_vols(struct3_39(n),struct3_39(1),1);
        end

        matrix4_39 = zeros(dm4);
        for n = 1:dm4(4)
            matrix4_39(:,:,:,n) = acid_read_vols(struct4_39(n),struct4_39(1),1);
        end

        matrix5_39 = zeros(dm5);
        for n = 1:dm5(4)
            matrix5_39(:,:,:,n) = acid_read_vols(struct5_39(n),struct5_39(1),1);
        end

        matrix6_39 = zeros(dm6);
        for n = 1:dm6(4)
            matrix6_39(:,:,:,n) = acid_read_vols(struct6_39(n),struct6_39(1),1);
        end

        matrix7_39 = zeros(dm6);
        for n = 1:dm6(4)
            matrix7_39(:,:,:,n) = acid_read_vols(struct7_39(n),struct7_39(1),1);
        end

        % SNR 52
        matrix1_52 = zeros(dm1);
        for n = 1:dm1(4)
            matrix1_52(:,:,:,n) = acid_read_vols(struct1_52(n),struct1_52(1),1);
        end

        matrix2_52 = zeros(dm2);
        for n = 1:dm2(4)
            matrix2_52(:,:,:,n) = acid_read_vols(struct2_52(n),struct2_52(1),1);
        end

        matrix3_52 = zeros(dm3);
        for n = 1:dm3(4)
            matrix3_52(:,:,:,n) = acid_read_vols(struct3_52(n),struct3_52(1),1);
        end

        matrix4_52 = zeros(dm4);
        for n = 1:dm4(4)
            matrix4_52(:,:,:,n) = acid_read_vols(struct4_52(n),struct4_52(1),1);
        end

        matrix5_52 = zeros(dm5);
        for n = 1:dm5(4)
            matrix5_52(:,:,:,n) = acid_read_vols(struct5_52(n),struct5_52(1),1);
        end

        matrix6_52 = zeros(dm6);
        for n = 1:dm6(4)
            matrix6_52(:,:,:,n) = acid_read_vols(struct6_52(n),struct6_52(1),1);
        end

        matrix7_52 = zeros(dm6);
        for n = 1:dm6(4)
            matrix7_52(:,:,:,n) = acid_read_vols(struct7_52(n),struct7_52(1),1);
        end

        % SNR 100
        matrix1_100 = zeros(dm1);
        for n = 1:dm1(4)
            matrix1_100(:,:,:,n) = acid_read_vols(struct1_100(n),struct1_100(1),1);
        end

        matrix2_100 = zeros(dm2);
        for n = 1:dm2(4)
            matrix2_100(:,:,:,n) = acid_read_vols(struct2_100(n),struct2_100(1),1);
        end

        matrix3_100 = zeros(dm3);
        for n = 1:dm3(4)
            matrix3_100(:,:,:,n) = acid_read_vols(struct3_100(n),struct3_100(1),1);
        end

        matrix4_100 = zeros(dm4);
        for n = 1:dm4(4)
            matrix4_100(:,:,:,n) = acid_read_vols(struct4_100(n),struct4_100(1),1);
        end

        matrix5_100 = zeros(dm5);
        for n = 1:dm5(4)
            matrix5_100(:,:,:,n) = acid_read_vols(struct5_100(n),struct5_100(1),1);
        end

        matrix6_100 = zeros(dm6);
        for n = 1:dm6(4)
            matrix6_100(:,:,:,n) = acid_read_vols(struct6_100(n),struct6_100(1),1);
        end

        matrix7_100 = zeros(dm6);
        for n = 1:dm6(4)
            matrix7_100(:,:,:,n) = acid_read_vols(struct7_100(n),struct7_100(1),1);
        end




        Y = matrix0(MSK_idx)';



        % SNR 5
        Y_hat_all(:,1) = matrix1_5(MSK_idx)';
        Y_hat_all(:,2) = matrix2_5(MSK_idx)';
        Y_hat_all(:,3) = matrix3_5(MSK_idx)';
        Y_hat_all(:,4) = matrix4_5(MSK_idx)';
        Y_hat_all(:,5) = matrix5_5(MSK_idx)';
        Y_hat_all(:,6) = matrix6_5(MSK_idx)';
        Y_hat_all(:,7) = matrix7_5(MSK_idx)';

        for p = 1:7
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            nrmse_mean_5(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean_5(:,p) = mbe / mean(Y,'all',"omitnan");
        end

        % SNR 15
        Y_hat_all(:,1) = matrix1_15(MSK_idx)';
        Y_hat_all(:,2) = matrix2_15(MSK_idx)';
        Y_hat_all(:,3) = matrix3_15(MSK_idx)';
        Y_hat_all(:,4) = matrix4_15(MSK_idx)';
        Y_hat_all(:,5) = matrix5_15(MSK_idx)';
        Y_hat_all(:,6) = matrix6_15(MSK_idx)';
        Y_hat_all(:,7) = matrix7_15(MSK_idx)';

        for p = 1:7
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            nrmse_mean_15(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean_15(:,p) = mbe / mean(Y,'all',"omitnan");
        end

        % SNR 30
        Y_hat_all(:,1) = matrix1_30(MSK_idx)';
        Y_hat_all(:,2) = matrix2_30(MSK_idx)';
        Y_hat_all(:,3) = matrix3_30(MSK_idx)';
        Y_hat_all(:,4) = matrix4_30(MSK_idx)';
        Y_hat_all(:,5) = matrix5_30(MSK_idx)';
        Y_hat_all(:,6) = matrix6_30(MSK_idx)';
        Y_hat_all(:,7) = matrix7_30(MSK_idx)';

        for p = 1:7
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            nrmse_mean_30(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean_30(:,p) = mbe / mean(Y,'all',"omitnan");
        end

        % SNR 39
        Y_hat_all(:,1) = matrix1_39(MSK_idx)';
        Y_hat_all(:,2) = matrix2_39(MSK_idx)';
        Y_hat_all(:,3) = matrix3_39(MSK_idx)';
        Y_hat_all(:,4) = matrix4_39(MSK_idx)';
        Y_hat_all(:,5) = matrix5_39(MSK_idx)';
        Y_hat_all(:,6) = matrix6_39(MSK_idx)';
        Y_hat_all(:,7) = matrix7_39(MSK_idx)';

        for p = 1:7
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            nrmse_mean_39(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean_39(:,p) = mbe / mean(Y,'all',"omitnan");
        end

        % SNR 52
        Y_hat_all(:,1) = matrix1_52(MSK_idx)';
        Y_hat_all(:,2) = matrix2_52(MSK_idx)';
        Y_hat_all(:,3) = matrix3_52(MSK_idx)';
        Y_hat_all(:,4) = matrix4_52(MSK_idx)';
        Y_hat_all(:,5) = matrix5_52(MSK_idx)';
        Y_hat_all(:,6) = matrix6_52(MSK_idx)';
        Y_hat_all(:,7) = matrix7_52(MSK_idx)';

        for p = 1:7
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            nrmse_mean_52(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean_52(:,p) = mbe / mean(Y,'all',"omitnan");
        end

        % SNR 100
        Y_hat_all(:,1) = matrix1_100(MSK_idx)';
        Y_hat_all(:,2) = matrix2_100(MSK_idx)';
        Y_hat_all(:,3) = matrix3_100(MSK_idx)';
        Y_hat_all(:,4) = matrix4_100(MSK_idx)';
        Y_hat_all(:,5) = matrix5_100(MSK_idx)';
        Y_hat_all(:,6) = matrix6_100(MSK_idx)';
        Y_hat_all(:,7) = matrix7_100(MSK_idx)';

        for p = 1:7
            Y_hat = Y_hat_all(:,p)';
            % RMSE
            errors = Y_hat - Y;      % (Ermittelt - GT)
            squareErrors = errors.^2;
            mse = mean(squareErrors,'all',"omitnan");
            rmse = sqrt(mse);
            % MBE
            mbe = mean(errors,'all',"omitnan");
            % NRMSE
            % if p == 5
            %     a = 4;
            % end
            nrmse_mean_100(:,p) = rmse / mean(Y,'all',"omitnan");
            % NMBE
            nmbe_mean_100(:,p) = mbe / mean(Y,'all',"omitnan");
        end


        if b == 1

            plot_1_y_nrmse = [nmbe_mean_5(:,1),nmbe_mean_15(:,1),nmbe_mean_30(:,1),nmbe_mean_39(:,1),nmbe_mean_52(:,1),nmbe_mean_100(:,1)];
            plot_2_y_nrmse = [nmbe_mean_5(:,2),nmbe_mean_15(:,2),nmbe_mean_30(:,2),nmbe_mean_39(:,2),nmbe_mean_52(:,2),nmbe_mean_100(:,2)];
            plot_3_y_nrmse = [nmbe_mean_5(:,3),nmbe_mean_15(:,3),nmbe_mean_30(:,3),nmbe_mean_39(:,3),nmbe_mean_52(:,3),nmbe_mean_100(:,3)];
            plot_4_y_nrmse = [nmbe_mean_5(:,4),nmbe_mean_15(:,4),nmbe_mean_30(:,4),nmbe_mean_39(:,4),nmbe_mean_52(:,4),nmbe_mean_100(:,4)];
            plot_5_y_nrmse = [nmbe_mean_5(:,5),nmbe_mean_15(:,5),nmbe_mean_30(:,5),nmbe_mean_39(:,5),nmbe_mean_52(:,5),nmbe_mean_100(:,5)];
            plot_6_y_nrmse = [nmbe_mean_5(:,6),nmbe_mean_15(:,6),nmbe_mean_30(:,6),nmbe_mean_39(:,6),nmbe_mean_52(:,6),nmbe_mean_100(:,6)];
            plot_7_y_nrmse = [nmbe_mean_5(:,7),nmbe_mean_15(:,7),nmbe_mean_30(:,7),nmbe_mean_39(:,7),nmbe_mean_52(:,7),nmbe_mean_100(:,7)];


        elseif b == 2

            plot_1_y_nrmse = [nrmse_mean_5(:,1),nrmse_mean_15(:,1),nrmse_mean_30(:,1),nrmse_mean_39(:,1),nrmse_mean_52(:,1),nrmse_mean_100(:,1)];
            plot_2_y_nrmse = [nrmse_mean_5(:,2),nrmse_mean_15(:,2),nrmse_mean_30(:,2),nrmse_mean_39(:,2),nrmse_mean_52(:,2),nrmse_mean_100(:,2)];
            plot_3_y_nrmse = [nrmse_mean_5(:,3),nrmse_mean_15(:,3),nrmse_mean_30(:,3),nrmse_mean_39(:,3),nrmse_mean_52(:,3),nrmse_mean_100(:,3)];
            plot_4_y_nrmse = [nrmse_mean_5(:,4),nrmse_mean_15(:,4),nrmse_mean_30(:,4),nrmse_mean_39(:,4),nrmse_mean_52(:,4),nrmse_mean_100(:,4)];
            plot_5_y_nrmse = [nrmse_mean_5(:,5),nrmse_mean_15(:,5),nrmse_mean_30(:,5),nrmse_mean_39(:,5),nrmse_mean_52(:,5),nrmse_mean_100(:,5)];
            plot_6_y_nrmse = [nrmse_mean_5(:,6),nrmse_mean_15(:,6),nrmse_mean_30(:,6),nrmse_mean_39(:,6),nrmse_mean_52(:,6),nrmse_mean_100(:,6)];
            plot_7_y_nrmse = [nrmse_mean_5(:,7),nrmse_mean_15(:,7),nrmse_mean_30(:,7),nrmse_mean_39(:,7),nrmse_mean_52(:,7),nrmse_mean_100(:,7)];
        end

        SNRlist = [5,15,30,39,52,100];

        % x = categorical({'msPOAS', 'LPCA', 'MP-PCA'});
        % data_nrmse_noRBC   = [nrmse_mean(:,1); nrmse_mean(:,2); nrmse_mean(:,3)];
        % data_nrmse_RBC   = [nrmse_mean(:,4); nrmse_mean(:,5); nrmse_mean(:,6)];
        %
        % data_nmbe_noRBC   = [nmbe_mean(:,1); nmbe_mean(:,2); nmbe_mean(:,3)];
        % data_nmbe_RBC   = [nmbe_mean(:,4); nmbe_mean(:,5); nmbe_mean(:,6)];


        title( DKI_Variables{i} )
        % % line([(SNRlist(1,1)-5) (SNRlist(1,end)+5)], [y(i) y(i)], 'Color', '#A2142F', 'LineStyle', '--'); hold on;
        % plot(SNRlist,plot_1_y_nrmse,"ro", 'LineStyle', '-','LineWidth',4); hold on; % no RBC POAS
        % plot(SNRlist,plot_2_y_nrmse,"b*", 'LineStyle', '-','LineWidth',4); hold on; % no RBC LPCA
        % plot(SNRlist,plot_3_y_nrmse,"g+", 'LineStyle', '-','LineWidth',4); hold on; % no RBC MP-PCA
        % plot(SNRlist,plot_7_y_nrmse,"k+", 'LineStyle','-','LineWidth',4); hold on; % no denosing
        % % plot(SNRlist,plot_4_y_nrmse,"ro", 'LineStyle', '--'); hold on; % RBC POAS
        % % plot(SNRlist,plot_5_y_nrmse,"b*", 'LineStyle', '--'); hold on; % RBC LPCA
        % % plot(SNRlist,plot_6_y_nrmse,"g+", 'LineStyle', '--'); hold on; % RBC MP-MPCA
        % 


        % line([(SNRlist(1,1)-5) (SNRlist(1,end)+5)], [y(i) y(i)], 'Color', '#A2142F', 'LineStyle', '--'); hold on;
        plot(SNRlist,plot_7_y_nrmse,"ro", 'LineStyle', '-','LineWidth',4); hold on; % no RBC POAS
        plot(SNRlist,plot_3_y_nrmse,"b*", 'LineStyle', '-','LineWidth',4); hold on; % no RBC LPCA
        % plot(SNRlist,plot_3_y_nrmse,"g+", 'LineStyle', '-','LineWidth',4); hold on; % no RBC MP-PCA
        % plot(SNRlist,plot_7_y_nrmse,"k+", 'LineStyle', '-','LineWidth',4); hold on; % no RBC MP-PCA
        % plot(SNRlist,plot_4_y_nrmse,"ro", 'LineStyle', '--'); hold on; % RBC POAS
        % plot(SNRlist,plot_5_y_nrmse,"b*", 'LineStyle', '--'); hold on; % RBC LPCA
        % plot(SNRlist,plot_6_y_nrmse,"g+", 'LineStyle', '--'); hold on; % RBC MP-MPCA





        % legend('msPOAS','LPCA','MP-PCA','no denoising')
        legend('no denoising','denosing')
                % legend('no RBC msPOAS','no RBC LPCA','no RBC MP-PCA','RBC msPOAS', 'RBC LPCA','RBC MP-PCA')
        
        xlim([(SNRlist(1,1)-5) (SNRlist(1,end)+5)])
        xlabel('SNR')

        if b == 1
            ylabel('NMBE')
            % yline(0,'k',"LineWidth",4,'HandleVisibility','off')
        elseif b == 2
            ylim([0 1])
            % yline(0,'k',"LineWidth",2)
            ylabel('NRMSE')
        end

    end

end

end