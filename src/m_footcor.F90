module m_footcor
use m_setup
use m_state
use m_readfootcor
contains
subroutine footcor(ip)
   integer, intent(in) :: ip

   part(ip)%foot%yh(:) = part(ip)%foot%yh(:) - ycor(ip)
   part(ip)%foot%yv(:) = part(ip)%foot%yv(:) - ycor(ip)

end subroutine
end module
