module grid
  implicit none
contains
  ! A subroutine to write output to a file
  subroutine set_grid(dx,vlnt)
    real,    intent(in) :: dx,xlnt
    REAL, intent(out), allocatable, DIMENSION(:) :: x
    integer, intent(out) :: xvln
    INTEGER    :: i
    xvln=NINT(xlnt/dx)
    do i=1,xvln
      x(i) = (i-1)*dx
    enddo
  end subroutine set_grid
end module grid
