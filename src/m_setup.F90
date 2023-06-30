module m_setup
   character(len=51) :: dir_project='/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project'
   character(len=3)  :: subdir_acc='acc'  ! input acceleration data
   character(len=3)  :: subdir_pos='pos'  ! input position data
   character(len=8)  :: subdir_accbias='acc_bias'
   character(len=8)  :: subdir_posbias='pos_bias'
   character(len=7)  :: subdir_foot='foot_FL'
   character(len=85) :: poscorfile=&
       '/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project/original_data/X2_tillegg_1-67.txt'
   character(len=82) :: footcorfile='/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project/foot_frame/foot_correction.txt'
   character(len=59) :: accposdir='/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project/accpos/'
   character(len=64) :: accposdirorig='/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project/accposfull/'
   character(len=64) :: accposdirfilt='/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project/accposfilt/'
   character(len=68) :: accposdirfullfilt='/home/AD.NORCERESEARCH.NO/geev/Dropbox/Axis_project/accposfullfilt/'
end module
