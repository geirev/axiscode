program axis
   use m_setup
   use m_state
   use m_readexperiment
   use m_referencepoint

   integer :: ip
   integer :: id
   integer :: is
   integer :: i

   do ip=1,41 !nrparticipants
      if ( ip == 9 ) cycle
      if ( ip == 13 ) cycle
      if ( ip == 25 ) cycle
      if ( ip == 34 ) cycle

      do id=1,nrdirections
         do is=1,nrspeeds
            call readexperiment(ip,id,is)
            call referencepoint(ip,id,is)
         enddo
      enddo
   enddo

   ip=12
   id=3
   is=2


   open(10,file='exp.dat')
   do i=1,part(ip)%expr(id,is)%nrlines
      write(10,'(i4,8(3f10.3))')i,part(ip)%expr(id,is)%ed1(i)
   enddo
   close(10)

   open(10,file='foot.dat')
   do i=1,feet(ip)%nrlines
      write(10,'(i4,4(3f10.3))')i,feet(ip)%foot(i)
   enddo
   close(10)

end program axis
