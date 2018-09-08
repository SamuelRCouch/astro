program hydr
  use output, only: out_set
implicit none

!Defining variable types
REAL    :: dt,pi,tmax,t,dx
INTEGER    :: i,j,k,filenumber,xvln
!REAL, allocatable, DIMENSION(:) :: numn,numo
!REAL, allocatable, DIMENSION(:) :: x,u
character(len=20) :: filename

!!Defining variables
!These values can be altered as required
tmax=1
xlnt=1
dx=0.001
!These values should not be changed
pi=4.D0*DATAN(1.D0)
dt=0.5*dx/v
t=0
xvln=NINT(xlnt/dx)

set_grid(dx,xvln)
set_init(xvln,x)
!Allocating the x and t vectors.
!allocate(x(xvln))
!allocate(numn(xvln))
!allocate(numo(xvln))


!Define x
!do i=1,xvln
!  xi(i) = (i-1)*dx
!enddo


!Initial Conditions
!do i=1,xvln
!  If (lbo<xi(i).AND.xi(i)<ubo) THEN
!    numn(i)=1
!  ELSE
!    numn(i)=0
!  ENDIF
!enddo


!xvln=xvln-1

!FTCS Method
do while (t<tmax)
  do i=1,xvln
    numo(i)=numn(i)
  enddo
  write(filename,'(a,i4.4)')'data_',filenumber
  open(1,file=filename,status='replace')
  do j=2,xvln-1
    numn(j)=(0.5)*(numo(j-1)+numo(j+1))-(v*dt)*((numo(j+1)-numo(j-1))/(2*dx))
  enddo
  numn(1)=(0.5)*(numo(xvln)+numo(2))-(v*dt)*((numo(2)-numo(xvln))/(2*dx))
  numn(xvln)=(0.5)*(numo(xvln-1)+numo(1))-(v*dt)*((numo(1)-numo(xvln-1))/(2*dx))
  do k = 1,xvln
    write(1,*) xi(k), numo(k)
  end do
  filenumber=filenumber+1
  t=t+dt
enddo

!Call Python
print*, 'Finished numerical method, running python, this may take a while'
call execute_command_line('python hyd.py')

!Animate
print*, 'Finished python, animating plots'
call execute_command_line('ffmpeg -i plot_%04d.png -f mp4 -vcodec libx264 -pix_fmt yuv420p plotan_2.mp4')

!call execute_command_line('xdg-open filename plotan_2.mp4')

end program hydr
