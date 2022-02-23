module m_writeoutfile
use m_setup
use m_state
contains
subroutine writeoutfile(ip,id,is)
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
   integer, intent(in) :: is  ! speed number (1-3)
   character(len=7) fileprefix
   character(len=100) filename
   integer i

   write(fileprefix,'(i2.2,a,i2.2,a,i1.1)')ip,'_',id,'_',is

   filename=trim(accposdir)//fileprefix//'.out'
   if (is == 1) then
      write(*,'(2a)',advance='no')'writing: ',trim(fileprefix)
   elseif(is==2) then
      write(*,'(tr1,a)',advance='no')trim(fileprefix)
   else
      write(*,'(tr1,a)')trim(fileprefix)
   endif


   open(10,file=trim(filename))
      write(10,'(a4,27a10)')'ind',' distance2',&
                                  '   pos1(x)',&
                                  '   pos1(y)',&
                                  '   pos1(z)',&
                                  '   pos2(x)',&
                                  '   pos2(y)',&
                                  '   pos2(z)',&
                                  '    ed1(x)',&
                                  '    ed1(y)',&
                                  '    ed1(z)',&
                                  '    ed9(x)',&
                                  '    ed9(y)',&
                                  '    ed9(z)',&
                                  '    ee6(x)',&
                                  '    ee6(y)',&
                                  '    ee6(z)',&
                                  '    efa(x)',&
                                  '    efa(y)',&
                                  '    efa(z)',&
                                  '    eff(x)',&
                                  '    eff(y)',&
                                  '    eff(z)',&
                                  '    f00(x)',&
                                  '    f00(y)',&
                                  '    f00(z)',&
                                  'spd 1 cm/s',&
                                  'spd 2 cm/s'
      do i=1,part(ip)%expr(id,is)%nrlines
         write(10,'(i4,27f10.3)')i,part(ip)%expr(id,is)%dist2(i)/part(ip)%foot%dist(id), &
                                   part(ip)%expr(id,is)%pos1(i),  &
                                   part(ip)%expr(id,is)%pos2(i),  &
                                   part(ip)%expr(id,is)%ed1(i),   &
                                   part(ip)%expr(id,is)%ed9(i),   &
                                   part(ip)%expr(id,is)%ee6(i),   &
                                   part(ip)%expr(id,is)%efa(i),   &
                                   part(ip)%expr(id,is)%eff(i),   &
                                   part(ip)%expr(id,is)%f00(i),   &
                                  10.0*part(ip)%expr(id,is)%speed1(i),&  ! dm/s
                                  10.0*part(ip)%expr(id,is)%speed2(i)    ! dm/s
      enddo
   close(10)

end subroutine
end module
