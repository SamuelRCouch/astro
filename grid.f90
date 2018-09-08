module grid
  implicit none
contains
  ! A subroutine to write output to a file
  subroutine set_grid(dx,xlnt)
    real,    intent(in) :: dx,xvln
    REAL, intent(out), allocatable, DIMENSION(:) :: x 
    INTEGER    :: i

    allocate(x(xvln))
    do i=1,xvln
      x(i) = (i-1)*dx
    enddo
  end subroutine set_grid
end module grid
