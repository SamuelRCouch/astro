module grid
  implicit none
contains
  ! A subroutine to write output to a file
  subroutine set_grid(dx,xvln)
    real,    intent(in) :: dx
    integer,  intent(in)  ::  xvln
    REAL :: x(xvln)
    INTEGER    :: i
    do i=1,xvln
      x(i) = (i-1)*dx
    enddo
  end subroutine set_grid
end module grid
