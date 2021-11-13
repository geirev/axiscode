module m_referencepoint
use m_state
contains
subroutine referencepoint(ip)
! For each participant, compute the average position of the first 10 recorded points for all directions and speeds
   integer, intent(in) :: ip  ! participant number (1-67)
   integer nrexp,d,s
   real x,y

   nrexp=0
   x=0.0
   y=0.0
   do d=1,nrdirections
      do s=1,nrspeeds
         if (part(ip)%expr(d,s)%lpos) then
            nrexp=nrexp+1
            x=x+sum(part(ip)%expr(d,s)%pos1(1:10)%x)/10.0
            y=y+sum(part(ip)%expr(d,s)%pos1(1:10)%y)/10.0
         endif
      enddo
   enddo
   if (nrexp .ge. 1) then
      part(ip)%xorigo=x/real(nrexp)
      part(ip)%yorigo=y/real(nrexp)
   else
      part(ip)%xorigo=0.0
      part(ip)%yorigo=0.0
      print *,'No reference point computed:',nrexp,part(ip)%xorigo,part(ip)%yorigo
   endif
   print *,'Reference point:',ip,part(ip)%xorigo,part(ip)%yorigo

end subroutine
end module
