module m_writeoutfile
use m_setup
use m_state
use mod_shapiro
contains

subroutine writeoutfile(ip,id,is,callnr)
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   integer, intent(in) :: callnr
   character(len=7) fileprefix
   character(len=100) filename
   integer i,j,nrl,nn
   real, allocatable :: ed1(:),ed9(:),ee6(:),efa(:),eff(:),f00(:)
   real, allocatable :: speed1(:),speed2(:)
   real, allocatable :: tmp(:)
   real pos1,pos2

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Shapiro filter variables
   integer, parameter :: shdim=8
   real sh(shdim)
   integer :: ish=2

   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')ip,'_',id,'_',is
   print *,'writeoutfile: ',fileprefix, callnr
   if (callnr == 1) then
      filename=' '
      filename=trim(accposdirorig)//fileprefix//'.out'
   elseif (callnr == 2) then
      filename=' '
      filename=trim(accposdir)//fileprefix//'.out'
   elseif (callnr == 3) then
      filename=' '
      filename=trim(accposdirfilt)//fileprefix//'.out'
   else
      stop
   endif

   nrl=max(part(ip)%expr(id,is)%ned1, &
           part(ip)%expr(id,is)%ned9, &
           part(ip)%expr(id,is)%nee6, &
           part(ip)%expr(id,is)%nefa, &
           part(ip)%expr(id,is)%neff, &
           part(ip)%expr(id,is)%nf00, &
           part(ip)%expr(id,is)%npos)

   if ( nrl < 10 ) return
   nrl=part(ip)%expr(id,is)%nrlines

   allocate(ed1(nrl), ed9(nrl), ee6(nrl), efa(nrl), eff(nrl), f00(nrl), speed1(nrl), speed2(nrl))


   do i=1,nrl
      if (i <= part(ip)%expr(id,is)%ned1 .and. part(ip)%expr(id,is)%led1) then
         ed1(i) = (part(ip)%expr(id,is)%ed1(i)%x)**2 &
                + (part(ip)%expr(id,is)%ed1(i)%y)**2 &
                + (part(ip)%expr(id,is)%ed1(i)%z)**2
      else
         ed1(i)=0.0
         part(ip)%expr(id,is)%ed1(i)%x=0.0
         part(ip)%expr(id,is)%ed1(i)%y=0.0
         part(ip)%expr(id,is)%ed1(i)%z=0.0
         part(ip)%expr(id,is)%led1=.false.
      endif

      if (i <= part(ip)%expr(id,is)%ned9 .and. part(ip)%expr(id,is)%led9) then
         ed9(i) = (part(ip)%expr(id,is)%ed9(i)%x)**2 &
                + (part(ip)%expr(id,is)%ed9(i)%y)**2 &
                + (part(ip)%expr(id,is)%ed9(i)%z)**2
      else
         ed9(i)=0.0
         part(ip)%expr(id,is)%ed9(i)%x=0.0
         part(ip)%expr(id,is)%ed9(i)%y=0.0
         part(ip)%expr(id,is)%ed9(i)%z=0.0
         part(ip)%expr(id,is)%led9=.false.
      endif

      if (i <= part(ip)%expr(id,is)%nee6 .and. part(ip)%expr(id,is)%lee6) then
         ee6(i) = (part(ip)%expr(id,is)%ee6(i)%x)**2 &
                + (part(ip)%expr(id,is)%ee6(i)%y)**2 &
                + (part(ip)%expr(id,is)%ee6(i)%z)**2
      else
         ee6(i)=0.0
         part(ip)%expr(id,is)%ee6(i)%x=0.0
         part(ip)%expr(id,is)%ee6(i)%y=0.0
         part(ip)%expr(id,is)%ee6(i)%z=0.0
         part(ip)%expr(id,is)%lee6=.false.
      endif

      if (i <= part(ip)%expr(id,is)%nefa .and. part(ip)%expr(id,is)%lefa) then
         efa(i) = (part(ip)%expr(id,is)%efa(i)%x)**2 &
                + (part(ip)%expr(id,is)%efa(i)%y)**2 &
                + (part(ip)%expr(id,is)%efa(i)%z)**2
      else
         efa(i)=0.0
         part(ip)%expr(id,is)%efa(i)%x=0.0
         part(ip)%expr(id,is)%efa(i)%y=0.0
         part(ip)%expr(id,is)%efa(i)%z=0.0
         part(ip)%expr(id,is)%lefa=.false.
      endif

      if (i <= part(ip)%expr(id,is)%neff .and. part(ip)%expr(id,is)%leff) then
         eff(i) = (part(ip)%expr(id,is)%eff(i)%x)**2 &
                + (part(ip)%expr(id,is)%eff(i)%y)**2 &
                + (part(ip)%expr(id,is)%eff(i)%z)**2
      else
         eff(i)=0.0
         part(ip)%expr(id,is)%eff(i)%x=0.0
         part(ip)%expr(id,is)%eff(i)%y=0.0
         part(ip)%expr(id,is)%eff(i)%z=0.0
         part(ip)%expr(id,is)%leff=.false.
      endif

      if (i <= part(ip)%expr(id,is)%nf00 .and. part(ip)%expr(id,is)%lf00) then
         f00(i) = (part(ip)%expr(id,is)%f00(i)%x)**2 &
                + (part(ip)%expr(id,is)%f00(i)%y)**2 &
                + (part(ip)%expr(id,is)%f00(i)%z)**2
      else
         f00(i)=0.0
         part(ip)%expr(id,is)%f00(i)%x=0.0
         part(ip)%expr(id,is)%f00(i)%y=0.0
         part(ip)%expr(id,is)%f00(i)%z=0.0
         part(ip)%expr(id,is)%lf00=.false.
      endif

      if (i <= part(ip)%expr(id,is)%npos .and. part(ip)%expr(id,is)%lpos) then
         pos1 = (part(ip)%expr(id,is)%pos1(i)%x)**2 &
              + (part(ip)%expr(id,is)%pos1(i)%y)**2 &
              + (part(ip)%expr(id,is)%pos1(i)%z)**2
         pos2 = (part(ip)%expr(id,is)%pos2(i)%x)**2 &
              + (part(ip)%expr(id,is)%pos2(i)%y)**2 &
              + (part(ip)%expr(id,is)%pos2(i)%z)**2
         speed1(i)=part(ip)%expr(id,is)%speed1(i)
         speed2(i)=part(ip)%expr(id,is)%speed2(i)
      else
         pos1=0.0
         part(ip)%expr(id,is)%pos1(i)%x=0.0
         part(ip)%expr(id,is)%pos1(i)%y=0.0
         part(ip)%expr(id,is)%pos1(i)%z=0.0
         part(ip)%expr(id,is)%speed1(i)=0.0
         pos2=0.0
         part(ip)%expr(id,is)%pos2(i)%x=0.0
         part(ip)%expr(id,is)%pos2(i)%y=0.0
         part(ip)%expr(id,is)%pos2(i)%z=0.0
         part(ip)%expr(id,is)%speed2(i)=0.0
         part(ip)%expr(id,is)%lpos=.false.
      endif
   enddo


   if (callnr  == 3) then
      call shfact(ish,sh)
      allocate(tmp(nrl))

      do j=1,10
         nn=nrl!part(ip)%expr(id,is)%ned1
         if (nn > 10 .and. part(ip)%expr(id,is)%led1) then
            call shfilt(ish,sh,nn,ed1,1,tmp,1,shdim)
            ed1(1:nn)=max(tmp(1:nn),0.001)
         endif

         nn=nrl!part(ip)%expr(id,is)%ned9
         if (nn > 10 .and. part(ip)%expr(id,is)%led9) then
            call shfilt(ish,sh,nn,ed9,1,tmp,1,shdim)
            ed9(1:nn)=max(tmp(1:nn),0.001)
         endif

         nn=nrl!part(ip)%expr(id,is)%nee6
         if (nn > 10 .and. part(ip)%expr(id,is)%lee6) then
            call shfilt(ish,sh,nn,ee6,1,tmp,1,shdim)
            ee6(1:nn)=max(tmp(1:nn),0.001)
         endif

         nn=nrl!part(ip)%expr(id,is)%nefa
         if (nn > 10 .and. part(ip)%expr(id,is)%lefa) then
            call shfilt(ish,sh,nn,efa,1,tmp,1,shdim)
            efa(1:nn)=max(tmp(1:nn),0.001)
         endif

         nn=nrl!part(ip)%expr(id,is)%neff
         if (nn > 10 .and. part(ip)%expr(id,is)%leff) then
            call shfilt(ish,sh,nn,eff,1,tmp,1,shdim)
            eff(1:nn)=max(tmp(1:nn),0.001)
         endif

         nn=nrl!part(ip)%expr(id,is)%nf00
         if (nn > 10 .and. part(ip)%expr(id,is)%lf00) then
            call shfilt(ish,sh,nn,f00,1,tmp,1,shdim)
            f00(1:nn)=max(tmp(1:nn),0.001)
         endif

         nn=nrl!part(ip)%expr(id,is)%npos
         if (nn > 10 .and. part(ip)%expr(id,is)%lpos) then
            call shfilt(ish,sh,nn,speed1,1,tmp,1,shdim)
            speed1(1:nn)=max(tmp(1:nn),0.001)
         endif

         if (nn > 10 .and. part(ip)%expr(id,is)%lpos) then
            call shfilt(ish,sh,nn,speed2,1,tmp,1,shdim)
            speed2(1:nn)=max(tmp(1:nn),0.001)
         endif
      enddo

      if (allocated(tmp)) deallocate(tmp)
   endif

   open(10,file=trim(filename))
      write(10,'(a4,35a11)')'ind','  distance2',&
                                  '    pos1(x)',&
                                  '    pos1(y)',&
                                  '    pos1(z)',&
                                  '    pos2(x)',&
                                  '    pos2(y)',&
                                  '    pos2(z)',&
                                  '     ed1(x)',&
                                  '     ed1(y)',&
                                  '     ed1(z)',&
                                  '     ed9(x)',&
                                  '     ed9(y)',&
                                  '     ed9(z)',&
                                  '     ee6(x)',&
                                  '     ee6(y)',&
                                  '     ee6(z)',&
                                  '     efa(x)',&
                                  '     efa(y)',&
                                  '     efa(z)',&
                                  '     eff(x)',&
                                  '     eff(y)',&
                                  '     eff(z)',&
                                  '     f00(x)',&
                                  '     f00(y)',&
                                  '     f00(z)',&
                                  ' spd 1 cm/s',&
                                  ' spd 2 cm/s',&
                                  '        ed1',&
                                  '        ed9',&
                                  '        ee6',&
                                  '        efa',&
                                  '        eff',&
                                  '        f00',&
                                  '       pos1',&
                                  '       pos2'

      do i =1,nrl
         write(10,'(i4,35f11.4)')i,part(ip)%expr(id,is)%dist2(i)/part(ip)%foot%dist(id), &
                                   part(ip)%expr(id,is)%pos1(i),  &
                                   part(ip)%expr(id,is)%pos2(i),  &
                                   part(ip)%expr(id,is)%ed1(i),   &
                                   part(ip)%expr(id,is)%ed9(i),   &
                                   part(ip)%expr(id,is)%ee6(i),   &
                                   part(ip)%expr(id,is)%efa(i),   &
                                   part(ip)%expr(id,is)%eff(i),   &
                                   part(ip)%expr(id,is)%f00(i),   &
                                  10.0*speed1(i),&  ! dm/s
                                  10.0*speed2(i),&  ! dm/s
                                   sqrt(ed1(i)),&
                                   sqrt(ed9(i)),&
                                   sqrt(ee6(i)),&
                                   sqrt(efa(i)),&
                                   sqrt(eff(i)),&
                                   sqrt(f00(i)),&
                                   sqrt(pos1),&
                                   sqrt(pos2)
      enddo
   close(10)

   deallocate(ed1,ed9,ee6,efa,eff,f00,speed1,speed2)

end subroutine
end module
