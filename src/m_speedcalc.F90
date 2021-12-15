module m_speedcalc
use m_state
contains
subroutine speedcalc(ip,id,is)
! Compute a speed of pos2 sensor
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer i
   real x1,y1
   real x2,y2
   real, parameter :: deltat=0.01  ! 1/100 of a second

   i=0
   if (part(ip)%expr(id,is)%lpos) then
      do i=2,part(ip)%expr(id,is)%nrlines
         x1=part(ip)%expr(id,is)%pos2(i-1)%x
         y1=part(ip)%expr(id,is)%pos2(i-1)%y
         x2=part(ip)%expr(id,is)%pos2(i)%x
         y2=part(ip)%expr(id,is)%pos2(i)%y
         part(ip)%expr(id,is)%speed(i)=   0.001*sqrt( (x2-x1)**2 + (y2-y1)**2 )/deltat   ! m/s
      enddo
   endif

end subroutine
end module
