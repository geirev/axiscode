module m_newnrlines
use m_state
contains
subroutine newnrlines(ip,id,is)
!  Compute a revised numger of lines to use from data files based

   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer i,ivar(1)
   integer nrlines,nrlines2(1)
   real emax(4)

   if (part(ip)%expr(id,is)%lpos) then
!  Estimate when the particiant starts to move back, to define first truncation of data
!      print *
!      print '(a,3I3)','ip,id,is:',ip,id,is
      nrlines=part(ip)%expr(id,is)%nrlines
!      print *,'nrlines0: ',nrlines
      do i=1,part(ip)%expr(id,is)%nrlines
         if ( (part(ip)%expr(id,is)%dist2(i) > 3.0*part(ip)%foot%dist(id)) .and. &
               part(ip)%expr(id,is)%dist2(i).lt.  part(ip)%expr(id,is)%dist2(i-1) ) then

            nrlines=i-1

            exit
         endif
      enddo

!      print *,'nrlines1: ',nrlines

!  Estimate when the particiant's foot has the largest acceleration and truncate there

      emax(1)= maxval(part(ip)%expr(id,is)%ee6(1:nrlines)%x)
      emax(2)= maxval(part(ip)%expr(id,is)%ee6(1:nrlines)%y)
      emax(3)= maxval(part(ip)%expr(id,is)%efa(1:nrlines)%x)
      emax(4)= maxval(part(ip)%expr(id,is)%efa(1:nrlines)%y)
!      print *,'emax: ',emax(:)
      ivar=maxloc(emax)
!      print *,'maxloc=',maxloc(emax),ivar
      select case (ivar(1))
      case(1)
         nrlines2=maxloc( part(ip)%expr(id,is)%ee6(1:nrlines)%x )
      case(2)
         nrlines2=maxloc( part(ip)%expr(id,is)%ee6(1:nrlines)%y )
      case(3)
         nrlines2=maxloc( part(ip)%expr(id,is)%efa(1:nrlines)%x )
      case(4)
         nrlines2=maxloc( part(ip)%expr(id,is)%efa(1:nrlines)%y )
      case default
         stop 'error in nrlines case select'
      end select


      part(ip)%expr(id,is)%nrlines=nrlines2(1)-2

   endif
!   print *,'nrlines final : ',nrlines2(1)-2

end subroutine
end module
