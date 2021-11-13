module m_referencepos
use m_state
contains
subroutine referencepos(ip,id,is)
! Make reference position of pos1 and pos2 sensors (0,0,0)
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)

   if (part(ip)%expr(id,is)%lpos) then
         print *,'z: ',part(ip)%expr(id,is)%pos1(1)%z, part(ip)%expr(id,is)%pos2(1)%z
         part(ip)%expr(id,is)%pos1(:)%x = part(ip)%expr(id,is)%pos1(:)%x - part(ip)%xorigo
         part(ip)%expr(id,is)%pos2(:)%x = part(ip)%expr(id,is)%pos2(:)%x - part(ip)%xorigo

         part(ip)%expr(id,is)%pos1(:)%y = part(ip)%expr(id,is)%pos1(:)%y - part(ip)%yorigo
         part(ip)%expr(id,is)%pos2(:)%y = part(ip)%expr(id,is)%pos2(:)%y - part(ip)%yorigo

         part(ip)%expr(id,is)%pos1(:)%z = part(ip)%expr(id,is)%pos1(:)%z - part(ip)%expr(id,is)%pos1(1)%z
         part(ip)%expr(id,is)%pos2(:)%z = part(ip)%expr(id,is)%pos2(:)%z - part(ip)%expr(id,is)%pos2(1)%z

!      do i=1,part(ip)%expr(id,is)%npos
!      enddo
         print *,'z: ',part(ip)%expr(id,is)%pos1(1)%z, part(ip)%expr(id,is)%pos2(1)%z
   endif

end subroutine
end module
