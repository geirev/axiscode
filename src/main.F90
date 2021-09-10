program axis
   use m_setup
   use m_state
   use m_readexperiment

   integer :: participant
   integer :: direction
   integer :: speed
   integer :: i

   !write(*,'(a)',advance='no')'Participant(0-67) : '
   !read(*,*)participant
   !write(*,'(a)',advance='no')'Direction  (0-12) : '
   !read(*,*)direction
   !write(*,'(a)',advance='no')'Speed      (1- 3) : '
   !read(*,*)speed
   participant=10
   direction=12
   speed=3

   call readexperiment(participant,direction,speed)

   do i=1,nrlines
      print '(i4,8(3f10.3))',i,exp(i)
   enddo
end program axis
