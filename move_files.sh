# Define variables for the remote machine and base directory
remote_machine="PolioVM"
remote_base_dir="~/Deep-Learning-Global-Health-Analytics"
remote_gis_dir=$remote_base_dir/GIS-Image-Stack-Processing

# Define the data directory
data_dir=$(cygpath -u "$OneDriveCommercial/DeepLearningDataArchive/")

# SCP commands using the defined variables
scp "$data_dir/Extract_in_DHS_Folder.zip" "$remote_machine:$remote_gis_dir/DHS"
scp "$data_dir/Extract_in_Rainfall_Folder.zip" "$remote_machine:$remote_gis_dir/Rainfall"
scp "$data_dir/landscan-global-2022.tif" "$remote_machine:$remote_gis_dir/Population"
scp "$data_dir/VNL_v22_npp-j01_2022_global_vcmslcfg_median.tif.zip" "$remote_machine:$remote_gis_dir/Nightlights"
scp "$data_dir/Extract_in_AOI_Folder.zip" "$remote_machine:$remote_gis_dir/AOI"
scp "$data_dir/ResNet18_4layers_5targets_lr_4e-05_bs_8_l2_0.02_do_0.4_ft_4_log_1_aug_1_trg_5__9AOI.pth" "$remote_machine:$remote_base_dir/ResNet18_CHECKPOINTS"


## Add the output files too
scp "$data_dir/Extract_in_Rainfall_Folder_also.zip" $remote_machine:$remote_gis_dir/Rainfall
scp "$data_dir/Extract_in_Population_also.zip" $remote_machine:$remote_gis_dir/Population
scp "$data_dir/Extract_in_Nightlights_also.zip" $remote_machine:$remote_gis_dir/Nightlights 



ssh $remote_machine << 'ENDSSH'
unzip ~/Deep-Learning-Global-Health-Analytics/GIS-Image-Stack-Processing/DHS/Extract_in_DHS_Folder.zip -d ~/Deep-Learning-Global-Health-Analytics/GIS-Image-Stack-Processing/DHS
unzip ~/Deep-Learning-Global-Health-Analytics/GIS-Image-Stack-Processing/Rainfall/Extract_in_Rainfall_Folder.zip -d ~/Deep-Learning-Global-Health-Analytics/GIS-Image-Stack-Processing/Rainfall
unzip ~/Deep-Learning-Global-Health-Analytics/GIS-Image-Stack-Processing/AOI/Extract_in_AOI_Folder.zip -d ~/Deep-Learning-Global-Health-Analytics/GIS-Image-Stack-Processing/AOI
ENDSSH