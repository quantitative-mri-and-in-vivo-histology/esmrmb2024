% example_nifti =     '/projects/crunchie/Malte/AxDKI_Inherent_Bias_Paper/Epilepsy_Pilot_Subject_2/raw_data/ep2d_diff_bval2dot5_1dot7mm_set1_0017/f2022-03-03_09-42-101142-00001-00001-1.nii';
% vol = spm_vol(example_nifti);

% "ImageOrientationPatient": [0.99961468939274,-0.0277573909123,-4.890340000000001e-10,0.00830509527288,0.29908775376015,-0.954189468053]

self_made_M = [0.99961468939274,-0.0277573909123,-4.890340000000001e-10;0.00830509527288,0.29908775376015,-0.954189468053;0,0,1];
self_made_M(3,:)= cross(self_made_M(1,:)',self_made_M(2,:)'); % Or json: "SliceNormalVector": [0.02648575,0.9538214,0.29920434],


test3       = self_made_M*bvec;