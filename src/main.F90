program axis
   use m_setup
   use m_state
   use m_readexperiment
   use m_readfootdata
   use m_referencepoint
   use m_newnrlines
   use m_writeoutfile
   use m_footpointsdir
   use m_pickfootpoint

   integer :: ip
   integer :: id
   integer :: is

! Reading all data and truncating unneeded data lines
   do ip=12,12 !nrparticipants
      if ( ip == 9  ) cycle
      if ( ip == 13 ) cycle
      if ( ip == 25 ) cycle
      if ( ip == 34 ) cycle

      call readfootdata(ip)
      do id=1,nrdirections
         do is=1,nrspeeds
            call readexperiment(ip,id,is)
         enddo
      enddo
   enddo

! Processing
   do ip=12,12 !nrparticipants
      if ( ip == 9  ) cycle
      if ( ip == 13 ) cycle
      if ( ip == 25 ) cycle
      if ( ip == 34 ) cycle

      call referencepoint(ip)
      call footpointsdir(ip)

      do id=1,nrdirections
         call pickfootpoint(ip,id)
         print '(a,2i3,f12.3)','dist: ',ip,id,part(ip)%foot%dist(id)
         do is=1,nrspeeds
            call newnrlines(ip,id,is)
            call writeoutfile(ip,id,is)
         enddo
      enddo
   enddo



end program axis
