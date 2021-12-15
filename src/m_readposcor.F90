module m_readposcor
use m_setup
use m_state
real :: xposcor(nrparticipants)
contains
subroutine readposcor
   real xpos
   integer i,ip
   print *,'reading ',trim(poscorfile)
   open(10,file=trim(poscorfile))
   do i=1,nrparticipants
      read(10,'(i2,tr1,f5.2)',end=100)ip,xpos
      print *,ip,xpos
      xposcor(ip)=xpos
   enddo

   100 close(10)

end subroutine
end module
