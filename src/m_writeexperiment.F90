module m_writeexperiment
use m_setup
use m_state
use m_ansi_colors
contains

subroutine writeexperiment(ip,id,is)
   ! writing out bias corrected acceleratrion data
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   character(len=7) fileprefix
   character(len=100) filename
   character(len=100) newdir
   character(len=31) :: header='PacketCounter,Acc_X,Acc_Y,Acc_Z'
   character(len=27) :: posheader='timestamp,x1,y1,z1,x2,y2,z2'
   integer i



   write(newdir,'(a,a,a,a)')'mkdir -p '//trim(dir_project)//'/'//subdir_posbias
   call system(trim(newdir))
   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')ip,'_',id,'_',is
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing corrected position data x1 ,y1, z1, x2 ,y2, z2
   filename=trim(dir_project)//'/'//subdir_posbias//'/'//fileprefix//'.xyz'
   if (part(ip)%expr(id,is)%lpos) then
      open(10,file=trim(filename))

      write(10,'(a)')trim(posheader)
      do i=1,part(ip)%expr(id,is)%npos
         write(10,'(i6,6f12.6)')i,part(ip)%expr(id,is)%pos1(i),part(ip)%expr(id,is)%pos2(i)
      enddo
      close(10)
   endif






   write(newdir,'(a,a,a,a)')'mkdir -p '//trim(dir_project)//'/'//subdir_accbias
   call system(trim(newdir))

   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')ip,'_',id,'_',is
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing bias correted ED1 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_accbias//'/'//fileprefix//'_00B41ED1'//'.acc'
   if (part(ip)%expr(id,is)%led1) then
      open(10,file=trim(filename))
      write(10,'(a)')trim(header)
      do i=1,part(ip)%expr(id,is)%ned1
         write(10,'(i6,3f12.6)')i,part(ip)%expr(id,is)%ed1(i)
      enddo
      close(10)
   endif


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing bias correted ED9 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_accbias//'/'//fileprefix//'_00B41ED9'//'.acc'
   if (part(ip)%expr(id,is)%led9) then
      open(10,file=trim(filename))
      write(10,'(a)')header
      do i=1,part(ip)%expr(id,is)%ned9
         write(10,'(i6,3f12.6)')i,part(ip)%expr(id,is)%ed9(i)
      enddo
      close(10)
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing bias correted EE6 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_accbias//'/'//fileprefix//'_00B41EE6'//'.acc'
   if (part(ip)%expr(id,is)%lee6) then
      open(10,file=trim(filename))
      write(10,'(a)')header
      do i=1,part(ip)%expr(id,is)%nee6
         write(10,'(i6,3f12.6)')i,part(ip)%expr(id,is)%ee6(i)
      enddo
      close(10)
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing bias correted EFA acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_accbias//'/'//fileprefix//'_00B41EFA'//'.acc'
   if (part(ip)%expr(id,is)%lefa) then
      open(10,file=trim(filename))
      write(10,'(a)')header
      do i=1,part(ip)%expr(id,is)%nefa
         write(10,'(i6,3f12.6)')i,part(ip)%expr(id,is)%efa(i)
      enddo
      close(10)
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing bias correted EFF acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_accbias//'/'//fileprefix//'_00B41EFF'//'.acc'
   if (part(ip)%expr(id,is)%leff) then
      open(10,file=trim(filename))
      write(10,'(a)')header
      do i=1,part(ip)%expr(id,is)%neff
         write(10,'(i6,3f12.6)')i,part(ip)%expr(id,is)%eff(i)
      enddo
      close(10)
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Writing bias correted  acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_accbias//'/'//fileprefix//'_00B41F00'//'.acc'
   if (part(ip)%expr(id,is)%lf00) then
      open(10,file=trim(filename))
      write(10,'(a)')header
      do i=1,part(ip)%expr(id,is)%nf00
         write(10,'(i6,3f12.6)')i,part(ip)%expr(id,is)%f00(i)
      enddo
      close(10)
   endif


end subroutine
end module
