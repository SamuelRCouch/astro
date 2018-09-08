module init
  implicit none
contains
  ! A subroutine to write output to a file
  subroutine set_init(xvln,numn)
    integer, intent(in) :: i,xvln
    real,    intent(in) :: x(xvln)
    REAL, intent(out),  DIMENSION(xvln) :: u
    character(len=40) :: filename
    integer :: i
    real :: ubo,lbo
    lbo=.25
    ubo=.75
    do i=1,xvln
      If (lbo<x(i).AND.x(i)<ubo) THEN
        numn(i)=1
      ELSE
        numn(i)=0
      ENDIF
    enddo
  end subroutine set_init
end module init
