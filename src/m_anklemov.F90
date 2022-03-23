module m_anklemov
use m_state
contains
subroutine anklemov(ip,id,is)
! For each participant, compute the average position of the first 10 recorded points for all directions and speeds
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction (1-12)
   integer, intent(in) :: is  ! speed (1-3)
   integer i,nrlines
   integer, parameter  :: lag=50
   real, allocatable :: ed1acc(:),ed9acc(:),ee6acc(:),efaacc(:),effacc(:),f00acc(:)
   real, allocatable :: ed1ave(:),ed9ave(:),ee6ave(:),efaave(:),effave(:),f00ave(:)
   real, allocatable :: ed1var(:),ed9var(:),ee6var(:),efavar(:),effvar(:),f00var(:)
   real dist
   real ed1sumx1,ed9sumx1,ee6sumx1,efasumx1,effsumx1,f00sumx1
   real ed1sumx2,ed9sumx2,ee6sumx2,efasumx2,effsumx2,f00sumx2

   nrlines=part(ip)%expr(id,is)%nrlines

   allocate(ed1acc(nrlines),ed9acc(nrlines),ee6acc(nrlines),efaacc(nrlines),effacc(nrlines),f00acc(nrlines))
   allocate(ed1ave(nrlines),ed9ave(nrlines),ee6ave(nrlines),efaave(nrlines),effave(nrlines),f00ave(nrlines))
   allocate(ed1var(nrlines),ed9var(nrlines),ee6var(nrlines),efavar(nrlines),effvar(nrlines),f00var(nrlines))

   do i=1,nrlines
      ed1acc(i) = (part(ip)%expr(id,is)%ed1(i)%x)**2 &
                + (part(ip)%expr(id,is)%ed1(i)%y)**2 &
                + (part(ip)%expr(id,is)%ed1(i)%z)**2

      ed9acc(i) = (part(ip)%expr(id,is)%ed9(i)%x)**2 &
                + (part(ip)%expr(id,is)%ed9(i)%y)**2 &
                + (part(ip)%expr(id,is)%ed9(i)%z)**2

      ee6acc(i) = (part(ip)%expr(id,is)%ee6(i)%x)**2 &
                + (part(ip)%expr(id,is)%ee6(i)%y)**2 &
                + (part(ip)%expr(id,is)%ee6(i)%z)**2

      efaacc(i) = (part(ip)%expr(id,is)%efa(i)%x)**2 &
                + (part(ip)%expr(id,is)%efa(i)%y)**2 &
                + (part(ip)%expr(id,is)%efa(i)%z)**2

      effacc(i) = (part(ip)%expr(id,is)%eff(i)%x)**2 &
                + (part(ip)%expr(id,is)%eff(i)%y)**2 &
                + (part(ip)%expr(id,is)%eff(i)%z)**2

      f00acc(i) = (part(ip)%expr(id,is)%f00(i)%x)**2 &
                + (part(ip)%expr(id,is)%f00(i)%y)**2 &
                + (part(ip)%expr(id,is)%f00(i)%z)**2
   enddo

   ed1sumx1=0.0; ed1sumx2=0.0
   ed9sumx1=0.0; ed9sumx2=0.0
   ee6sumx1=0.0; ee6sumx2=0.0
   efasumx1=0.0; efasumx2=0.0
   effsumx1=0.0; effsumx2=0.0
   f00sumx1=0.0; f00sumx2=0.0

   do i=1,nrlines
      ed1sumx1=ed1sumx1+sqrt(ed1acc(i)); ed1sumx2=ed1sumx2+ed1acc(i)
      ed9sumx1=ed9sumx1+sqrt(ed9acc(i)); ed9sumx2=ed9sumx2+ed9acc(i)
      ee6sumx1=ee6sumx1+sqrt(ee6acc(i)); ee6sumx2=ee6sumx2+ee6acc(i)
      efasumx1=efasumx1+sqrt(efaacc(i)); efasumx2=efasumx2+efaacc(i)
      effsumx1=effsumx1+sqrt(effacc(i)); effsumx2=effsumx2+effacc(i)
      f00sumx1=f00sumx1+sqrt(f00acc(i)); f00sumx2=f00sumx2+f00acc(i)

      if (i > lag) then
         ed1sumx1=ed1sumx1-sqrt(ed1acc(i-lag))
         ed9sumx1=ed9sumx1-sqrt(ed9acc(i-lag))
         ee6sumx1=ee6sumx1-sqrt(ee6acc(i-lag))
         efasumx1=efasumx1-sqrt(efaacc(i-lag))
         effsumx1=effsumx1-sqrt(effacc(i-lag))
         f00sumx1=f00sumx1-sqrt(f00acc(i-lag))

         ed1sumx2=ed1sumx2-ed1acc(i-lag)
         ed9sumx2=ed9sumx2-ed9acc(i-lag)
         ee6sumx2=ee6sumx2-ee6acc(i-lag)
         efasumx2=efasumx2-efaacc(i-lag)
         effsumx2=effsumx2-effacc(i-lag)
         f00sumx2=f00sumx2-f00acc(i-lag)


         ed1ave(i)=ed1sumx1/real(lag)
         ed9ave(i)=ed9sumx1/real(lag)
         ee6ave(i)=ee6sumx1/real(lag)
         efaave(i)=efasumx1/real(lag)
         effave(i)=effsumx1/real(lag)
         f00ave(i)=f00sumx1/real(lag)

         ed1var(i)=(ed1sumx2 -ed1ave(i)**2)/real(lag-1)
         ed9var(i)=(ed9sumx2 -ed9ave(i)**2)/real(lag-1)
         ee6var(i)=(ee6sumx2 -ee6ave(i)**2)/real(lag-1)
         efavar(i)=(efasumx2 -efaave(i)**2)/real(lag-1)
         effvar(i)=(effsumx2 -effave(i)**2)/real(lag-1)
         f00var(i)=(f00sumx2 -f00ave(i)**2)/real(lag-1)
      endif
   enddo

   open(10,file='test.dat')
      do i=lag+1,nrlines
         dist=part(ip)%expr(id,is)%dist2(i)/part(ip)%foot%dist(id)
         write(10,'(i4,7f12.5)')i,dist,abs(sqrt(ed1acc(i))-ed1ave(i))/sqrt(ed1var(i)),&
                                       abs(sqrt(ed9acc(i))-ed9ave(i))/sqrt(ed9var(i)),&
                                       abs(sqrt(ee6acc(i))-ee6ave(i))/sqrt(ee6var(i)),&
                                       abs(sqrt(efaacc(i))-efaave(i))/sqrt(efavar(i)),&
                                       abs(sqrt(effacc(i))-effave(i))/sqrt(effvar(i)),&
                                       abs(sqrt(f00acc(i))-f00ave(i))/sqrt(f00var(i))
      enddo
   close(10)

   deallocate(ed1acc,ed9acc,ee6acc,efaacc,effacc,f00acc)
   deallocate(ed1ave,ed9ave,ee6ave,efaave,effave,f00ave)
   deallocate(ed1var,ed9var,ee6var,efavar,effvar,f00var)

end subroutine
end module
