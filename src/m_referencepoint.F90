module m_referencepoint
use m_state
contains
subroutine referencepoint(ip)
! For each participant, compute the average position of the first 10 recorded points for all directions and speeds
   integer, intent(in) :: ip  ! participant number (1-67)
   integer nrexp,d,s
   real x1,y1,z1
   real x2,y2,z2


! Center point of frame (subtract 10 mm to mimmic center of mass location)
! First 41 taken in Osterøy and the rest in bergen lead to small difference in frames.
   if (ip < 42) then
      part(ip)%xorigo=611.460 - 10.0
      part(ip)%yorigo=-31.254
   else
      part(ip)%xorigo=613.92 - 10.0
      part(ip)%yorigo= -2.01
   endif

   nrexp=0; x1=0.0; y1=0.0; z1=0.0; x2=0.0; y2=0.0; z2=0.0
   do d=1,nrdirections
      do s=1,nrspeeds
         if (part(ip)%expr(d,s)%lpos) then
            nrexp=nrexp+1
            x1=x1+sum(part(ip)%expr(d,s)%pos1(1:20)%x)/20.0
            y1=y1+sum(part(ip)%expr(d,s)%pos1(1:20)%y)/20.0
            z1=z1+sum(part(ip)%expr(d,s)%pos1(1:20)%z)/20.0
            x2=x2+sum(part(ip)%expr(d,s)%pos2(1:20)%x)/20.0
            y2=y2+sum(part(ip)%expr(d,s)%pos2(1:20)%y)/20.0
            z2=z2+sum(part(ip)%expr(d,s)%pos2(1:20)%z)/20.0
         endif
      enddo
   enddo
   if (nrexp .ge. 1) then
      part(ip)%xstart1=x1/real(nrexp)
      part(ip)%ystart1=y1/real(nrexp)
      part(ip)%zstart1=z1/real(nrexp)
      part(ip)%xstart2=x2/real(nrexp)-10.0
      part(ip)%ystart2=y2/real(nrexp)
      part(ip)%zstart2=z2/real(nrexp)
   else
      part(ip)%xstart1=part(ip)%xorigo
      part(ip)%ystart1=part(ip)%yorigo
      part(ip)%zstart1=0.0
      part(ip)%xstart2=part(ip)%xorigo
      part(ip)%ystart2=part(ip)%yorigo
      part(ip)%zstart2=0.0
      print *,'No reference point computed:'
   endif
   print '(tr20,a,tr6,a,tr6,a,tr4,a,a,i2)','ip','pos1','pos2','center',' nrexp=',nrexp
   print '(a,i3,3f10.4)','Reference point: x ',ip,part(ip)%xstart1,part(ip)%xstart2,part(ip)%xorigo
   print '(a,i3,3f10.4)','Reference point: y ',ip,part(ip)%ystart1,part(ip)%ystart2,part(ip)%yorigo
   print '(a,i3,2f10.4)','Reference point: z ',ip,part(ip)%zstart1,part(ip)%zstart2

end subroutine
end module
