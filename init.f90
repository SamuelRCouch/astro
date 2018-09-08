module init
  implicit none
contains
  ! A subroutine to write output to a file
  subroutine set_init(xvln,x, u)
    integer, intent(in) :: xvln
    real,    intent(in) :: x(xvln)
    !REAL, intent(out),  DIMENSION(xvln) :: u
    REAL, intent(out) :: u(xvln)
    integer :: i
    real :: ubo,lbo
    lbo=.25
    ubo=.75
    do i=1,xvln
      If (lbo<x(i).AND.x(i)<ubo) THEN
        u(i)=1
      ELSE
        u(i)=0
      ENDIF
    enddo
  end subroutine set_init
end module init
