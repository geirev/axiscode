module m_state
   type coord
      real x
      real y
      real z
   end type

   type experiment
      type(coord) :: pos1
      type(coord) :: pos2
      type(coord) :: ed1
      type(coord) :: ed9
      type(coord) :: ee6
      type(coord) :: efa
      type(coord) :: eff
      type(coord) :: f00
   end type

   integer :: nrlines
   type (experiment) , allocatable :: exp(:)
end module
