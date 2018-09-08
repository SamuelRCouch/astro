module output
  implicit none
contains
  ! A subroutine to write output to a file
  subroutine write_output(dx,xvln)
    integer, intent(in) :: dx
    real,    intent(in) :: xvln
    character(len=40) :: filename
    integer :: i
    write(filename,'(a,i4.4)')'data_',filenumber
    open(1,file=filename,status='replace')
    do i = 1,xvln
      write(1,*) xi(i), numo(i)
    end do
    filenumber=filenumber+1
  end subroutine write_output
end module output
