program axis
   use m_setup
   use m_state
   use m_readexperiment
   use m_writeexperiment
   use m_readfootdata
   use m_referencepoint
   use m_distpos
   use m_newnrlines
   use m_speedcalc
   use m_writeoutfile
   use m_writefootdata
   use m_referencepos
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

      call readfootdata(ip)                   ! Reading the foot data
      do id=1,nrdirections
         do is=1,nrspeeds
            call readexperiment(ip,id,is)     ! Reading all files for an experiment
            call accbias(ip,id,is)            ! Remove bias in acceleration data
            call writeexperiment(ip,id,is)    ! Saves all files (with bias correction)
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
      call referencepoint(ip)                 ! xorigo, xtart1, xstart2, ...

      call footpointsdir(ip)                  ! relative to xorigo and yorigo

      call writefootdata(ip)                  ! relative to xorigo and yorigo

      print *,' '
      do id=1,nrdirections
         call pickfootpoint(ip,id)            ! Distance and direction from xy-origo to the foot points
         do is=1,nrspeeds
            call distpos(ip,id,is)            ! Compute movement distances relative xstart (ystart/yorigo) for pos1 and pos2
            call newnrlines(ip,id,is)         ! Truncate timeseries after experiment
            call speedcalc(ip,id,is)          ! Calculate speed
            call referencepos(ip,id,is)       ! Subtract reference value from position data
            call writeoutfile(ip,id,is)       ! Write new output files for plotting
         enddo
      enddo
   enddo



end program axis
