module m_readexperiment
use m_setup
use m_state
contains
subroutine readexperiment(participant,direction,speed)
   integer, intent(in) :: participant
   integer, intent(in) :: direction
   integer, intent(in) :: speed
   character(len=7) fileprefix
   character(len=100) filename
   character(len=100) header
   logical ex
   integer i,itmp
   real tmp

   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')participant,'_',direction,'_',speed

   print *,'fileprefix=',fileprefix

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading position data x1 ,y1, z1, x2 ,y2, z2
   filename=trim(dir_project)//'/'//subdir_pos//'/'//fileprefix//'.xyz'
   print *,'reading filename=',trim(filename)

   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,100000
         read(10,*,end=100)tmp
      enddo
      100 nrlines=i-1
      print *,'nrlines=',nrlines
      close(10)
      allocate(exp(nrlines))

      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)tmp,exp(i)%pos1,exp(i)%pos2
      enddo
      close(10)
   else
      stop 'pos file does not exist'
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading ED1 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41ED1'//'.acc'
   print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)itmp,exp(i)%ed1
      enddo
      close(10)
   else
      stop 'acc file does not exist'
   endif


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading ED9 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41ED9'//'.acc'
   print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)itmp,exp(i)%ed9
      enddo
      close(10)
   else
      stop 'acc file does not exist'
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EE6 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EE6'//'.acc'
   print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)itmp,exp(i)%ee6
         !print '(i4,i10,3f12.6)',i,itmp,ee6(i)
      enddo
      close(10)
   else
      stop 'acc file does not exist'
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EFA acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EFA'//'.acc'
   print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)itmp,exp(i)%efa
         !print '(i4,i10,3f12.6)',i,itmp,efa(i)
      enddo
      close(10)
   else
      stop 'acc file does not exist'
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EFF acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EFF'//'.acc'
   print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)itmp,exp(i)%eff
      enddo
      close(10)
   else
      stop 'acc file does not exist'
   endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41F00'//'.acc'
   print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)itmp,exp(i)%f00
      enddo
      close(10)
   else
      stop 'acc file does not exist'
   endif

end subroutine
end module
