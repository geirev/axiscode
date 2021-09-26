module m_referencepoint
use m_state
contains
subroutine referencepoint(ip,id,is)
! Compute the average position of the first recorded point for all directions and speeds
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer i,d,s
   real x,y

   i=0
   x=0.0
   y=0.0
   do d=1,nrdirections
      do s=1,nrspeeds
         if (part(ip)%expr(d,s)%lpos) then
            i=i+1
            x=x+part(ip)%expr(d,s)%pos2(1)%x
            y=y+part(ip)%expr(d,s)%pos2(1)%y
         endif
      enddo
   enddo
   if (i .ge. 1) then
      part(ip)%xorigo=x/real(i)
      part(ip)%yorigo=y/real(i)
   else
      part(ip)%xorigo=0.0
      part(ip)%yorigo=0.0
      print *,'No reference point computed:',i,part(ip)%xorigo,part(ip)%yorigo
   endif
   print *,'reference point:',i,part(ip)%xorigo,part(ip)%yorigo

end subroutine
end module
