module m_readexperiment
use m_setup
use m_state
contains
subroutine readexperiment(ip,id,is)
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   character(len=7) fileprefix
   character(len=100) filename
   character(len=100) header
   logical ex
   integer i,nrlines
   real tmp

   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')ip,'_',id,'_',is


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading position data x1 ,y1, z1, x2 ,y2, z2
   ! part(1-67)%expr(1-12,1:3)%pos2(1:nrlmax)%x
   filename=trim(dir_project)//'/'//subdir_pos//'/'//fileprefix//'.xyz'
   print *,'reading filename=',trim(filename)

   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lpos=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,100000
         read(10,*,end=100)tmp
      enddo
      100 nrlines=i-1
      close(10)

      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)tmp,part(ip)%expr(id,is)%pos1(i),part(ip)%expr(id,is)%pos2(i)
      enddo
      close(10)
   else
      part(ip)%expr(id,is)%lpos=.false.
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading ED1 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41ED1'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%led1=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*,end=101)tmp,part(ip)%expr(id,is)%ed1(i)
      enddo
      101 nrlines=i-1
      close(10)
   else
      part(ip)%expr(id,is)%led1=.false.
   endif


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading ED9 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41ED9'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%led9=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*,end=102)tmp,part(ip)%expr(id,is)%ed9(i)
      enddo
      102 nrlines=i-1
      close(10)
   else
      part(ip)%expr(id,is)%led9=.false.
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EE6 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EE6'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lee6=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*,end=103)tmp,part(ip)%expr(id,is)%ee6(i)
      enddo
      103 nrlines=i-1
      close(10)
   else
      part(ip)%expr(id,is)%lee6=.false.
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EFA acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EFA'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lefa=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*,end=104)tmp,part(ip)%expr(id,is)%efa(i)
      enddo
      104 nrlines=i-1
      close(10)
   else
      part(ip)%expr(id,is)%lefa=.false.
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EFF acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EFF'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%leff=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*,end=105)tmp,part(ip)%expr(id,is)%eff(i)
      enddo
      105 nrlines=i-1
      close(10)
   else
      part(ip)%expr(id,is)%leff=.false.
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41F00'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lf00=.true.
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*,end=106)tmp,part(ip)%expr(id,is)%f00(i)
      enddo
      106 nrlines=i-1
      close(10)
   else
      part(ip)%expr(id,is)%lf00=.false.
   endif

   part(ip)%expr(id,is)%nrlines=nrlines


end subroutine
end module
