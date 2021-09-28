module m_newnrlines
use m_state
contains
subroutine newnrlines(ip,id,is)
! Compute a revised numger of lines to use from data files based on when the particiant starts to move back
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer i
   real x,y

   i=0
   if (part(ip)%expr(id,is)%lpos) then
      print *,'part pre  nrlines:',part(ip)%expr(id,is)%nrlines
      do i=1,part(ip)%expr(id,is)%nrlines
         x=part(ip)%expr(id,is)%pos2(i)%x
         y=part(ip)%expr(id,is)%pos2(i)%y
         part(ip)%expr(id,is)%dist2(i)=sqrt( (x-part(ip)%xorigo)**2 + (y-part(ip)%yorigo)**2 )
         ! test on outside of foot instead of i> 200
         if ( (part(ip)%expr(id,is)%dist2(i) > part(ip)%foot%dist(id)) .and. &
               part(ip)%expr(id,is)%dist2(i).lt.  part(ip)%expr(id,is)%dist2(i-1) ) then
            part(ip)%expr(id,is)%nrlines=i-1
            exit
         endif
      enddo
      print *,'part post nrlines:',part(ip)%expr(id,is)%nrlines
   endif

end subroutine
end module
