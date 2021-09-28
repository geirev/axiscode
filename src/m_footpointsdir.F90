module m_footpointsdir
use m_state
contains
subroutine footpointsdir(ip)
! Computes the directions from the origo to the footpoints
   integer, intent(in) :: ip  ! participant number (1-67)
   real, parameter :: pi=3.1415926535
   integer i
   real x,y

   do i=1,part(ip)%foot%nrlinesv
      x=part(ip)%foot%xv(i)
      y=part(ip)%foot%yv(i)
      part(ip)%foot%dirv(i)= atan2( (y-part(ip)%yorigo), (x-part(ip)%xorigo) )*180.0/pi
      print *,'dirv: ',ip,part(ip)%foot%dirv(i),i
   enddo

   do i=1,part(ip)%foot%nrlinesh
      x=part(ip)%foot%xh(i)
      y=part(ip)%foot%yh(i)
      part(ip)%foot%dirh(i)= atan2( (y-part(ip)%yorigo), (x-part(ip)%xorigo) )*180.0/pi
      print *,'dirh: ',ip,part(ip)%foot%dirh(i),i
   enddo

end subroutine
end module
