module m_writefootdata
use m_setup
use m_state
contains
subroutine writefootdata(ip)
   integer, intent(in) :: ip  ! participant number (1-67)
   character(len=2) cip
   character(len=100) filename
   integer i

   write(cip,'(i2.2)')ip
   filename=cip//'_footright.out'
   print *,'writing filename=',trim(filename)
   open(10,file=trim(filename))
      write(10,'(a4,6a10)')'ind','     xh(i)','     yh(i)','   dirh(i)'
      do i=1,part(ip)%foot%nrlinesh
         write(10,'(i4,3f10.3)')i,part(ip)%foot%xh(i)-part(ip)%xorigo,&
                                  part(ip)%foot%yh(i)-part(ip)%yorigo,&
                                  part(ip)%foot%dirh(i)
      enddo
   close(10)

   filename=cip//'_footleft.out'
   print *,'writing filename=',trim(filename)
   open(10,file=trim(filename))
      write(10,'(a4,6a10)')'ind','     xv(i)','     yv(i)','   dirv(i)'
      do i=1,part(ip)%foot%nrlinesv
         write(10,'(i4,3f10.3)')i,part(ip)%foot%xv(i)-part(ip)%xorigo,&
                                  part(ip)%foot%yv(i)-part(ip)%yorigo,&
                                  part(ip)%foot%dirv(i)
      enddo
   close(10)

   filename=cip//'_origo.out'
   print *,'writing filename=',trim(filename)
   open(10,file=trim(filename))
      write(10,'(6(3f10.3))')part(ip)%xorigo-part(ip)%xorigo,part(ip)%yorigo-part(ip)%yorigo
   close(10)

end subroutine
end module

