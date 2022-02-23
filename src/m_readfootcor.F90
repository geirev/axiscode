module m_readfootcor
! Read a correction to the frame position for some participants
use m_setup
use m_state
real :: ycor(nrparticipants)
contains
subroutine readfootcor
   real xpos
   integer i,ip
   print *,'reading ',trim(footcorfile)
   open(10,file=trim(footcorfile))
   do i=1,nrparticipants
      read(10,*,end=100)ip,xpos
      print *,ip,xpos
      ycor(ip)=xpos
   enddo

   100 close(10)

end subroutine
end module
