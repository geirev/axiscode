module m_pickfootpoint
use m_state
contains
subroutine pickfootpoint(ip,id)
! Find the best foot point for direction
   integer, intent(in) :: ip  ! participant number (1-67)
   integer, intent(in) :: id  ! direction number (1-12)
!   real, parameter :: directions(12)=(/ 30.0, 60.0, 90.0, 120.0, 150.0, 180.0, 210.0, 240.0, 270.0, 300.0, 330.0, 360.0 /)
   real, parameter :: directions(12)=(/ 30.0, 60.0, 90.0, 120.0, 150.0, 180.0, -30.0, -60.0, -90.0,-120.0,-150.0,-180.0 /)
   real, parameter :: pi=3.1415926535
   integer i,j,idpos
   real theta, newtheta

   select case(id)
   case(1)
      ! 30 degres take distance to max point on right foot
      i=part(ip)%foot%nrlinesh
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xh(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yh(i) - part(ip)%yorigo)**2 )

   case(11)
      ! 330 degres take distance to max point on left foot
      i=part(ip)%foot%nrlinesv
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xv(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yv(i) - part(ip)%yorigo)**2 )

   case(12)
      ! 360 degres take average distance to max point from both feet
      i=part(ip)%foot%nrlinesv
      j=part(ip)%foot%nrlinesh
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xv(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yv(i) - part(ip)%yorigo)**2 )*0.5 &
                            + sqrt( (part(ip)%foot%xh(j) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yh(j) - part(ip)%yorigo)**2 )*0.5

   case(5)
      ! 150 degres take distance to max point on right foot
      i=1
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xh(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yh(i) - part(ip)%yorigo)**2 )

   case(7)
      ! 210 degres take distance to max point on left foot
      i=1
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xv(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yv(i) - part(ip)%yorigo)**2 )

   case(6)
      ! 180 degres take average distance to min point from both feet
      i=1
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xv(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yv(i) - part(ip)%yorigo)**2 )*0.5 &
                            + sqrt( (part(ip)%foot%xh(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yh(i) - part(ip)%yorigo)**2 )*0.5

   case(2,3,4)
      theta=360.0
      idpos=1
      do i=1,part(ip)%foot%nrlinesh
         newtheta=abs(directions(id)-part(ip)%foot%dirh(i))
         if (newtheta < theta) then
            theta=newtheta
            idpos=i
         endif
      enddo
      i=idpos
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xh(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yh(i) - part(ip)%yorigo)**2 )

   case(8,9,10)
      theta=360.0
      idpos=1
      do i=1,part(ip)%foot%nrlinesv
         newtheta=abs(directions(id)-part(ip)%foot%dirv(i))
         if (newtheta < theta) then
            theta=newtheta
            idpos=i
         endif
      enddo
      i=idpos
      part(ip)%foot%dist(id)= sqrt( (part(ip)%foot%xv(i) - part(ip)%xorigo)**2 &
                                  + (part(ip)%foot%yv(i) - part(ip)%yorigo)**2 )

   case default
      stop 'no such id'
   end select


end subroutine
end module
