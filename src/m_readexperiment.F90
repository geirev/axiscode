module m_readexperiment
! Here we only read all the data for one experiment.
use m_setup
use m_state
use m_ansi_colors
contains
   integer function numberoflines(filename)
      character(len=100), intent(in) :: filename
      character(len=100) header
      integer i
      real tmp
      open(10,file=trim(filename))
         read(10,'(a)')header
         do i=1,100000
            read(10,*,end=100)tmp
         enddo
         100 numberoflines=i-1
      close(10)
   end function

   integer function lpstat(ident,lstat)
      character(len=*), intent(in) :: ident
      logical,          intent(in) :: lstat
      if (lstat) then
         write(*,'(tr1,2a,a,a)',advance='no')color(ident,c_green),'(',color('T',c_green),')'
      else
         write(*,'(tr1,2a,a,a)',advance='no')color(ident,c_magenta),'(',color('F',c_magenta),')'
      endif
   end function

   function readaccdata(filename,nrlines) result(w)
      character(len=100), intent(in) :: filename
      integer, intent(in) :: nrlines
      character(len=100) header
      type(coord) :: w(nrlines)
      integer i
      real tmp
      open(10,file=trim(filename))
         read(10,'(a)')header
         do i=1,nrlines
            read(10,*)tmp,w(i)
         enddo
      close(10)
   end function

subroutine readexperiment(ip,id,is)
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   character(len=7) fileprefix
   character(len=100) filename
   character(len=100) header
   logical ex
   real tmp
   integer i

   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')ip,'_',id,'_',is

   write(*,'(a,a,tr1)',advance='no')'Reading: ',color(fileprefix,c_yellow)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading position data x1 ,y1, z1, x2 ,y2, z2
   ! part(1-67)%expr(1-12,1:3)%pos2(1:nrlmax)%x
   filename=trim(dir_project)//'/'//subdir_pos//'/'//fileprefix//'.xyz'

   part(ip)%expr(id,is)=0.0

   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lpos=.true.
      part(ip)%expr(id,is)%npos=numberoflines(filename)

      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,part(ip)%expr(id,is)%npos
         read(10,*)tmp,part(ip)%expr(id,is)%pos1(i),part(ip)%expr(id,is)%pos2(i)
      enddo
      close(10)
   else
      part(ip)%expr(id,is)%lpos=.false.
      part(ip)%expr(id,is)%npos=-1
   endif
   i=lpstat('POS',part(ip)%expr(id,is)%lpos)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading ED1 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41ED1'//'.acc'
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%led1=.true.
      part(ip)%expr(id,is)%ned1=numberoflines(filename)
      part(ip)%expr(id,is)%ed1=readaccdata(filename,part(ip)%expr(id,is)%ned1)
   else
      part(ip)%expr(id,is)%led1=.false.
      part(ip)%expr(id,is)%ned1=0
   endif
   i=lpstat('ED1',part(ip)%expr(id,is)%led1)


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading ED9 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41ED9'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%led9=.true.
      part(ip)%expr(id,is)%ned9=numberoflines(filename)
      part(ip)%expr(id,is)%ed9=readaccdata(filename,part(ip)%expr(id,is)%ned9)
   else
      part(ip)%expr(id,is)%led9=.false.
      part(ip)%expr(id,is)%ned9=-1
   endif
   i=lpstat('ED9',part(ip)%expr(id,is)%led9)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EE6 acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EE6'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lee6=.true.
      part(ip)%expr(id,is)%nee6=numberoflines(filename)
      part(ip)%expr(id,is)%ee6=readaccdata(filename,part(ip)%expr(id,is)%nee6)
   else
      part(ip)%expr(id,is)%lee6=.false.
      part(ip)%expr(id,is)%nee6=-1
   endif
   i=lpstat('EE6',part(ip)%expr(id,is)%lee6)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EFA acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EFA'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lefa=.true.
      part(ip)%expr(id,is)%nefa=numberoflines(filename)
      part(ip)%expr(id,is)%efa=readaccdata(filename,part(ip)%expr(id,is)%nefa)
   else
      part(ip)%expr(id,is)%lefa=.false.
      part(ip)%expr(id,is)%nefa=-1
   endif
   i=lpstat('EFA',part(ip)%expr(id,is)%lefa)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading EFF acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41EFF'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%leff=.true.
      part(ip)%expr(id,is)%neff=numberoflines(filename)
      part(ip)%expr(id,is)%eff=readaccdata(filename,part(ip)%expr(id,is)%neff)
   else
      part(ip)%expr(id,is)%leff=.false.
      part(ip)%expr(id,is)%neff=-1
   endif
   i=lpstat('EFF',part(ip)%expr(id,is)%leff)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Reading acceleration data x ,y, z
   filename=trim(dir_project)//'/'//subdir_acc//'/'//fileprefix//'_00B41F00'//'.acc'
   !print *,'reading filename=',trim(filename)
   inquire(file=trim(filename),exist=ex)
   if (ex) then
      part(ip)%expr(id,is)%lf00=.true.
      part(ip)%expr(id,is)%nf00=numberoflines(filename)
      part(ip)%expr(id,is)%f00=readaccdata(filename,part(ip)%expr(id,is)%nf00)
   else
      part(ip)%expr(id,is)%lf00=.false.
      part(ip)%expr(id,is)%nf00=-1
   endif
   i=lpstat('F00',part(ip)%expr(id,is)%lf00)

   part(ip)%expr(id,is)%nrlines=-1
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%npos )
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%ned1 )
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%ned9 )
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%nee6 )
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%nefa )
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%neff )
   part(ip)%expr(id,is)%nrlines = max( part(ip)%expr(id,is)%nrlines, part(ip)%expr(id,is)%nf00 )

   print '(a,7i4)',' nrlines=',part(ip)%expr(id,is)%npos,&
                               part(ip)%expr(id,is)%ned1,&
                               part(ip)%expr(id,is)%ned9,&
                               part(ip)%expr(id,is)%nee6,&
                               part(ip)%expr(id,is)%nefa,&
                               part(ip)%expr(id,is)%neff,&
                               part(ip)%expr(id,is)%nf00




end subroutine
end module
