module m_state
   integer, parameter :: nrparticipants=67
   integer, parameter :: nrdirections=12
   integer, parameter :: nrspeeds=3
   integer, parameter :: nrlmax=1000

   integer, parameter :: nrfootpoints=50


   type coord
      real x
      real y
      real z
   end type

   type experiment
      integer nrlines
      logical lpos,led1,led9,lee6,lefa,leff,lf00
      real        :: dist2(nrlmax)
      real        :: speed(nrlmax)
      type(coord) :: pos1(nrlmax)
      type(coord) :: pos2(nrlmax)
      type(coord) :: ed1(nrlmax)
      type(coord) :: ed9(nrlmax)
      type(coord) :: ee6(nrlmax)
      type(coord) :: efa(nrlmax)
      type(coord) :: eff(nrlmax)
      type(coord) :: f00(nrlmax)
   end type

   type footdata
      integer nrlinesv
      integer nrlinesh
      real xh(nrfootpoints)
      real yh(nrfootpoints)
      real xv(nrfootpoints)
      real yv(nrfootpoints)
      real dirv(nrfootpoints)
      real dirh(nrfootpoints)
      real dist(12)
   end type

   type participant
      real xorigo,yorigo
      type (experiment) :: expr(nrdirections,nrspeeds)
      type (footdata)   :: foot
   end type

   type (participant)  ::  part(nrparticipants)

   ! part(1-67)%expr(1-12,1:3)%pos2(1:nrlmax)%x
   ! part(1-67)%foot%xh(i)
   ! part(1-67)%foot%nrlines

end module
