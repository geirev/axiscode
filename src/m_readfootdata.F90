module m_readfootdata
use m_setup
use m_state
contains
subroutine readfootdata(ip)
   integer, intent(in) :: ip  ! participant number (1-67)
   character(len=100) filename
   character(len=100) header
   character(len=2) tag2
   logical ex
   integer i,i1(1),i2(1),j,nrlines
   real tmp
   real xh(nrfootpoints),yh(nrfootpoints),xv(nrfootpoints),yv(nrfootpoints)

! Reading foot data
   write(tag2,'(i2.2)')ip
   filename=' '
   filename=trim(dir_project)//'/'//subdir_foot//'/FL'//tag2//'.csv'
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

      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)xh(i),yh(i),xv(i),yv(i)
      enddo
      close(10)

      i1=minloc(xh(1:nrlines))
      i2=maxloc(xh(1:nrlines))
      j=0
      do i=i1(1),i2(1)
         j=j+1
         part(ip)%foot%xh(j)=xh(i)
         part(ip)%foot%yh(j)=yh(i)
      enddo
      part(ip)%foot%nrlinesh=j

      i1=minloc(xv(1:nrlines))
      i2=maxloc(xv(1:nrlines))
      j=0
      do i=i1(1),i2(1)
         j=j+1
         part(ip)%foot%xv(j)=xv(i)
         part(ip)%foot%yv(j)=yv(i)
      enddo
      part(ip)%foot%nrlinesv=j

   else
      stop 'foot file does not exist'
   endif

   ! part(1-67)%foot%xh(i)
   ! part(1-67)%foot%nrlines

end subroutine
end module
