module m_setup
   character(len=100) :: dir_project='/home/geve/Dropbox/Axis_project'
   character(len=3)   :: subdir_acc='acc'  ! input acceleration data
   character(len=3)   :: subdir_pos='pos'  ! input position data
   character(len=8)   :: subdir_accbias='acc_bias'
   character(len=8)   :: subdir_posbias='pos_bias'
   character(len=7)   :: subdir_foot='foot_FL'
   character(len=65)  :: poscorfile= '/home/geve/Dropbox/Axis_project/original_data/X2_tillegg_1-67.txt'
   character(len=62)  :: footcorfile='/home/geve/Dropbox/Axis_project/foot_frame/foot_correction.txt'
   character(len=39)  :: accposdir='/home/geve/Dropbox/Axis_project/accpos/'
end module
