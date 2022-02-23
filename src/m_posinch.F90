module m_posinch
use m_state
contains
subroutine posinch(ip,id,is)
   integer, intent(in) :: ip,id,is
   integer i
   real, parameter :: conv=25.4 ! conversion from inces to mm

   if ((ip == 24) .or. (ip == 35) .or. (ip == 42) .or. (ip == 43)) then
      do i=1,part(ip)%expr(id,is)%npos
         part(ip)%expr(id,is)%pos1(i)%x = part(ip)%expr(id,is)%pos1(i)%x*conv
         part(ip)%expr(id,is)%pos1(i)%y = part(ip)%expr(id,is)%pos1(i)%y*conv
         part(ip)%expr(id,is)%pos1(i)%z = part(ip)%expr(id,is)%pos1(i)%z*conv

         part(ip)%expr(id,is)%pos2(i)%x = part(ip)%expr(id,is)%pos2(i)%x*conv
         part(ip)%expr(id,is)%pos2(i)%y = part(ip)%expr(id,is)%pos2(i)%y*conv
         part(ip)%expr(id,is)%pos2(i)%z = part(ip)%expr(id,is)%pos2(i)%z*conv
      enddo
   endif

end subroutine
end module
