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
   integer i,nrlines
   real tmp
   real xh(nrfootpoints),yh(nrfootpoints),xv(nrfootpoints),yv(nrfootpoints)

! Reading foot data
   write(tag2,'(i2.2)')ip
   filename=' '
   filename=trim(dir_project)//'/'//subdir_foot//'/FL'//tag2//'.csv'
   print *,'reading filename=',trim(filename)

   inquire(file=trim(filename),exist=ex)
   if (ex) then
      ! Counting number of lines
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,100000
         read(10,*,end=100)tmp
      enddo
      100 nrlines=i-1
      close(10)

      ! reading data
      open(10,file=trim(filename))
      read(10,'(a)')header
      do i=1,nrlines
         read(10,*)xh(i),yh(i),xv(i),yv(i)
      enddo
      close(10)

      ! Copy data to foot class
      do i=1,nrlines
         part(ip)%foot%xh(i)=xh(i)
         part(ip)%foot%yh(i)=yh(i)
         part(ip)%foot%xv(i)=xv(i)
         part(ip)%foot%yv(i)=yv(i)
      enddo
      part(ip)%foot%nrlinesh=nrlines
      part(ip)%foot%nrlinesv=nrlines

   else
      stop 'foot file does not exist'
   endif

   ! part(1-67)%foot%xh(i)
   ! part(1-67)%foot%nrlines

end subroutine
end module
