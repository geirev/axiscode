module m_distpos
use m_state
contains
subroutine distpos(ip,id,is)
! Compute movement distances for pos1 and pos2 sensors
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer i
   real x,y

   if (part(ip)%expr(id,is)%lpos) then
      do i=1,part(ip)%expr(id,is)%nrlines
         x=part(ip)%expr(id,is)%pos1(i)%x
         y=part(ip)%expr(id,is)%pos1(i)%y
         part(ip)%expr(id,is)%dist1(i)=sqrt( (x-part(ip)%xstart1)**2 + (y-part(ip)%ystart1)**2 )

         x=part(ip)%expr(id,is)%pos2(i)%x
         y=part(ip)%expr(id,is)%pos2(i)%y
         part(ip)%expr(id,is)%dist2(i)=sqrt( (x-part(ip)%xstart2)**2 + (y-part(ip)%ystart2)**2 )
      enddo
   endif

end subroutine
end module
