module m_accbias
use m_state
contains
subroutine accbias(ip,id,is)
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   real bias

   if (part(ip)%expr(id,is)%nrlines < 50) return

   bias=sum(part(ip)%expr(id,is)%ed1(1:10)%x)/10.0
   part(ip)%expr(id,is)%ed1(:)%x=part(ip)%expr(id,is)%ed1(:)%x-bias

   bias=sum(part(ip)%expr(id,is)%ed1(1:10)%y)/10.0
   part(ip)%expr(id,is)%ed1(:)%y=part(ip)%expr(id,is)%ed1(:)%y-bias

   bias=sum(part(ip)%expr(id,is)%ed1(1:10)%z)/10.0
   part(ip)%expr(id,is)%ed1(:)%z=part(ip)%expr(id,is)%ed1(:)%z-bias


   bias=sum(part(ip)%expr(id,is)%ed9(1:10)%x)/10.0
   part(ip)%expr(id,is)%ed9(:)%x=part(ip)%expr(id,is)%ed9(:)%x-bias

   bias=sum(part(ip)%expr(id,is)%ed9(1:10)%y)/10.0
   part(ip)%expr(id,is)%ed9(:)%y=part(ip)%expr(id,is)%ed9(:)%y-bias

   bias=sum(part(ip)%expr(id,is)%ed9(1:10)%z)/10.0
   part(ip)%expr(id,is)%ed9(:)%z=part(ip)%expr(id,is)%ed9(:)%z-bias


   bias=sum(part(ip)%expr(id,is)%ee6(1:10)%x)/10.0
   part(ip)%expr(id,is)%ee6(:)%x=part(ip)%expr(id,is)%ee6(:)%x-bias

   bias=sum(part(ip)%expr(id,is)%ee6(1:10)%y)/10.0
   part(ip)%expr(id,is)%ee6(:)%y=part(ip)%expr(id,is)%ee6(:)%y-bias

   bias=sum(part(ip)%expr(id,is)%ee6(1:10)%z)/10.0
   part(ip)%expr(id,is)%ee6(:)%z=part(ip)%expr(id,is)%ee6(:)%z-bias



   bias=sum(part(ip)%expr(id,is)%efa(1:10)%x)/10.0
   part(ip)%expr(id,is)%efa(:)%x=part(ip)%expr(id,is)%efa(:)%x-bias

   bias=sum(part(ip)%expr(id,is)%efa(1:10)%y)/10.0
   part(ip)%expr(id,is)%efa(:)%y=part(ip)%expr(id,is)%efa(:)%y-bias

   bias=sum(part(ip)%expr(id,is)%efa(1:10)%z)/10.0
   part(ip)%expr(id,is)%efa(:)%z=part(ip)%expr(id,is)%efa(:)%z-bias



   bias=sum(part(ip)%expr(id,is)%eff(1:10)%x)/10.0
   part(ip)%expr(id,is)%eff(:)%x=part(ip)%expr(id,is)%eff(:)%x-bias

   bias=sum(part(ip)%expr(id,is)%eff(1:10)%y)/10.0
   part(ip)%expr(id,is)%eff(:)%y=part(ip)%expr(id,is)%eff(:)%y-bias

   bias=sum(part(ip)%expr(id,is)%eff(1:10)%z)/10.0
   part(ip)%expr(id,is)%eff(:)%z=part(ip)%expr(id,is)%eff(:)%z-bias



   bias=sum(part(ip)%expr(id,is)%f00(1:10)%x)/10.0
   part(ip)%expr(id,is)%f00(:)%x=part(ip)%expr(id,is)%f00(:)%x-bias

   bias=sum(part(ip)%expr(id,is)%f00(1:10)%y)/10.0
   part(ip)%expr(id,is)%f00(:)%y=part(ip)%expr(id,is)%f00(:)%y-bias

   bias=sum(part(ip)%expr(id,is)%f00(1:10)%z)/10.0
   part(ip)%expr(id,is)%f00(:)%z=part(ip)%expr(id,is)%f00(:)%z-bias

end subroutine
end module
