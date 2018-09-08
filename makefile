FC=gfortran
FFLAGS= -O3 -Wall -Wextra -std=f2008 -fdefault-real-8 -fdefault-double-8

SRC=grid.f90 init.f90 hydr.f90
OBJ=${SRC:.f90=.o}

hydr.o: grid.o init.o

%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

hydr: ${OBJ}
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	rm -f *.o *.mod dat* plot*
