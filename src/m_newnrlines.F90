module m_newnrlines
use m_state
contains
subroutine newnrlines(ip,id,is)
! Compute a revised numger of lines to use from data files based on when the particiant starts to move back
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer i

   if (part(ip)%expr(id,is)%lpos) then
      do i=1,part(ip)%expr(id,is)%nrlines
         if ( (part(ip)%expr(id,is)%dist2(i) > 3.0*part(ip)%foot%dist(id)) .and. &
               part(ip)%expr(id,is)%dist2(i).lt.  part(ip)%expr(id,is)%dist2(i-1) ) then

            part(ip)%expr(id,is)%nrlines=i-1

            exit
         endif
      enddo
   endif

end subroutine
end module
