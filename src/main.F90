program axis
   use m_setup
   use m_state
   use m_readexperiment
   use m_readfootdata
   use m_referencepoint
   use m_newnrlines
   use m_speedcalc
   use m_writeoutfile
   use m_writefootdata
   use m_accbias
   use m_footpointsdir
   use m_pickfootpoint

   integer :: ip
   integer :: id
   integer :: is

! Reading all data and truncating unneeded data lines
   do ip=01,02 !nrparticipants
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
   do ip=01,02 !nrparticipants
      if ( ip == 9  ) cycle
      if ( ip == 13 ) cycle
      if ( ip == 25 ) cycle
      if ( ip == 34 ) cycle

      print *,' '
      print *,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
      call referencepoint(ip)

      call footpointsdir(ip)

      call writefootdata(ip)

      print *,' '
      do id=1,nrdirections
         call pickfootpoint(ip,id)
         do is=1,nrspeeds
            call newnrlines(ip,id,is)
            call speedcalc(ip,id,is)
            call accbias(ip,id,is)
            call writeoutfile(ip,id,is)
         enddo
      enddo
   enddo



end program axis
