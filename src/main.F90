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
   use m_readposcor
   use m_readfootcor
   use m_poscor
   use m_posinch
   use m_footcor
   use m_anklemov

   integer :: ip
   integer :: id
   integer :: is

   call readposcor                            ! Reading the pos2 tilleggstall
   call readfootcor                           ! Read correction to footdata

   do ip=1,67 !nrparticipants
      if ( (ip==9) .or. (ip==13) .or. (ip==25) .or. (ip==34) .or. (ip==41) ) cycle

      call readfootdata(ip)                   ! Reading the foot data
      call footcor(ip)                        ! Correcting frame position of foot data

      do id=1,nrdirections
         do is=1,nrspeeds
            call readexperiment(ip,id,is)     ! Reading all files for an experiment
            call posinch(ip,id,is)            ! Transforming from inches to mm pos data in some experients
            call poscor(ip,id,is)             ! Correcting reference values for pos2%x
            call accbias(ip,id,is)            ! Remove bias in acceleration data
         enddo
      enddo

      call referencepoint(ip)                 ! xorigo, xtart1, xstart2, ...
      call footpointsdir(ip)                  ! relative to xorigo and yorigo
      call writefootdata(ip)                  ! relative to xorigo and yorigo

      print *,' '
      do id=1,nrdirections
         call pickfootpoint(ip,id)            ! Distance and direction from xy-origo to the foot points
         do is=1,nrspeeds
            call distpos(ip,id,is)            ! Distances relative xstart (ystart/yorigo) for pos1 and pos2
            call speedcalc(ip,id,is)          ! Calculate speed
            call referencepos(ip,id,is)       ! Subtract reference value from position data
            call writeoutfile(ip,id,is,1)     ! Write new output files for plotting
            call newnrlines(ip,id,is)         ! Truncate timeseries after experiment
            call writeexperiment(ip,id,is)    ! Saves all files (with bias correction)
            call writeoutfile(ip,id,is,2)     ! Write new output files for plotting
         enddo
      enddo

      do id=1,nrdirections
         do is=1,nrspeeds
            call writeoutfile(ip,id,is,3)     ! Write new filtered output files for plotting
!            call anklemov(ip,id,is)           ! Looking for first ankle momvement
         enddo
      enddo
   enddo


end program axis
