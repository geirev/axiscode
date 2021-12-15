module m_poscor
use m_setup
use m_state
use m_readposcor
contains
subroutine poscor(ip,id,is)
   integer, intent(in) :: ip,id,is
   integer i

   do i=1,part(ip)%expr(id,is)%npos
      part(ip)%expr(id,is)%pos2(i)%x = part(ip)%expr(id,is)%pos2(i)%x + xposcor(ip)
   enddo

end subroutine
end module
