#! /bin/sh
# This is a shell archive, meaning:
# 1. Remove everything above the #! /bin/sh line.
# 2. Save the resulting text in a file.
# 3. Execute the file with /bin/sh (not csh) to create the files:
#	Fortran/
#	Fortran/Sp/
#	Fortran/Sp/Drivers/
#	Fortran/Sp/Drivers/Makefile
#	Fortran/Sp/Drivers/driver.f
#	Fortran/Sp/Drivers/res
#	Fortran/Sp/Src/
#	Fortran/Sp/Src/src.f
# This archive created: Wed Jan 18 20:30:21 2006
export PATH; PATH=/bin:$PATH
if test ! -d 'Fortran'
then
	mkdir 'Fortran'
fi
cd 'Fortran'
if test ! -d 'Sp'
then
	mkdir 'Sp'
fi
cd 'Sp'
if test ! -d 'Drivers'
then
	mkdir 'Drivers'
fi
cd 'Drivers'
if test -f 'Makefile'
then
	echo shar: will not over-write existing file "'Makefile'"
else
cat << "SHAR_EOF" > 'Makefile'
all: Res

src.o: src.f
	$(F77) $(F77OPTS) -c src.f

driver.o: driver.f
	$(F77) $(F77OPTS) -c driver.f

DRIVERS= driver
RESULTS= Res

Objs1= driver.o src.o
driver: $(Objs1)
	$(F77) $(F77OPTS) -o driver $(Objs1) $(SRCLIBS)
Res: driver 
	./driver >Res

diffres:Res res
	echo "Differences in results from driver"
	$(DIFF) Res res

clean: 
	rm -rf *.o $(DRIVERS) $(CLEANUP) $(RESULTS)
SHAR_EOF
fi # end of overwriting check
if test -f 'driver.f'
then
	echo shar: will not over-write existing file "'driver.f'"
else
cat << "SHAR_EOF" > 'driver.f'
      program main

!******************************************************************************!C      ALGORITHM 347, COLLECTED ALGORITHMS FROM ACM.
!C      THIS WORK PUBLISHED IN COMMUNICATIONS OF THE ACM
!C      VOL. 12, NO. 3, March, 1969, PP.185--187.
*
!
!! MAIN tests SORT.
!
!  Modified:
!
!    04 January 2006
!
!  Author:
!
!    John Burkardt
!
      implicit none

      integer ii
      integer jj

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS347_PRB'
      write ( *, '(a)' ) '  Test SORT, which ascending sorts'
      write ( *, '(a)' ) '  an integer vector.'

      ii = 1
      jj = 20
      call test01 ( ii, jj )

      ii = 5
      jj = 18
      call test01 ( ii, jj )
      
      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS347_PRB'
      write ( *, '(a)' ) '  Normal end of execution.'

      stop
      end
      subroutine test01 ( ii, jj )

!*******************************************************************************
!
!! TEST01 tests SORT on a particular range of indices.
!
!  Modified:
!
!    04 January 2006
!
!  Author:
!
!    John Burkardt
!
      implicit none

      integer n
      parameter ( n = 20 )

      integer a(n)
      integer i
      integer ii
      integer jj
      real rn
      integer seed

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TEST01'
      write ( *, '(a)' ) '  SORT ascending sorts an integer vector.'
      write ( *, '(a,i6)' ) '  Here we sort entries II = ', ii
      write ( *, '(a,i6)' ) '  through JJ = ', jj

      seed = 123456789
      do i = 1, n
        a(i) = int ( n * rn ( seed ) )
      end do

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  Unsorted array:'
      write ( *, '(a)' ) ' '
      do i = 1, n
        write ( *, '(2x,i6,2x,i6)' ) i, a(i)
      end do

      call sort ( a, ii, jj )

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) '  Sorted array:'
      write ( *, '(a)' ) ' '
      do i = 1, n
        write ( *, '(2x,i6,2x,i6)' ) i, a(i)
      end do

      return
      end
      function rn ( seed )

c*******************************************************************************
c
cc RN returns a unit single precision pseudorandom number.
c
c  Discussion:
c
c    This routine implements the recursion
c
c      seed = 16807 * seed mod ( 2**31 - 1 )
c      rn = seed / ( 2**31 - 1 )
c
c    The integer arithmetic never requires more than 32 bits,
c    including a sign bit.
c
c    If the initial seed is 12345, then the first three computations are
c
c      Input     Output      RN
c      SEED      SEED
c
c         12345   207482415  0.096616
c     207482415  1790989824  0.833995
c    1790989824  2035175616  0.947702
c
c  Modified:
c
c    11 August 2004
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Paul Bratley, Bennett Fox, L E Schrage,
c    A Guide to Simulation,
c    Springer Verlag, pages 201-202, 1983.
c
c    Pierre L'Ecuyer,
c    Random Number Generation,
c    in Handbook of Simulation,
c    edited by Jerry Banks,
c    Wiley Interscience, page 95, 1998.
c
c    Bennett Fox,
c    Algorithm 647:
c    Implementation and Relative Efficiency of Quasirandom
c    Sequence Generators,
c    ACM Transactions on Mathematical Software,
c    Volume 12, Number 4, pages 362-376, 1986.
c
c    P A Lewis, A S Goodman, J M Miller,
c    A Pseudo-Random Number Generator for the System/360,
c    IBM Systems Journal,
c    Volume 8, pages 136-143, 1969.
c
c  Parameters:
c
c    Input/output, integer SEED, the "seed" value, which should NOT be 0.
c    On output, SEED has been updated.
c
c    Output, real RN, a new pseudorandom variate,
c    strictly between 0 and 1.
c
      implicit none

      integer k
      integer seed
      real rn

      k = seed / 127773

      seed = 16807 * ( seed - k * 127773 ) - k * 2836

      if ( seed < 0 ) then
        seed = seed + 2147483647
      end if
c
c  Although SEED can be represented exactly as a 32 bit integer,
c  it generally cannot be represented exactly as a 32 bit real number!
c
      rn = real ( dble ( seed ) * 4.656612875D-10 )

      return
      end
SHAR_EOF
fi # end of overwriting check
if test -f 'res'
then
	echo shar: will not over-write existing file "'res'"
else
cat << "SHAR_EOF" > 'res'
 
TOMS347_PRB
  Test SORT, which ascending sorts
  an integer vector.
 
TEST01
  SORT ascending sorts an integer vector.
  Here we sort entries II =      1
  through JJ =     20
 
  Unsorted array:
 
       1       4
       2      19
       3      16
       4      11
       5       8
       6       1
       7       5
       8       2
       9       0
      10      12
      11       1
      12       8
      13       8
      14      15
      15      15
      16       0
      17      17
      18       7
      19       1
      20       0
 
  Sorted array:
 
       1       0
       2       0
       3       0
       4       1
       5       1
       6       1
       7       2
       8       4
       9       5
      10       7
      11       8
      12       8
      13       8
      14      11
      15      12
      16      15
      17      15
      18      16
      19      17
      20      19
 
TEST01
  SORT ascending sorts an integer vector.
  Here we sort entries II =      5
  through JJ =     18
 
  Unsorted array:
 
       1       4
       2      19
       3      16
       4      11
       5       8
       6       1
       7       5
       8       2
       9       0
      10      12
      11       1
      12       8
      13       8
      14      15
      15      15
      16       0
      17      17
      18       7
      19       1
      20       0
 
  Sorted array:
 
       1       4
       2      19
       3      16
       4      11
       5       0
       6       0
       7       1
       8       1
       9       2
      10       5
      11       7
      12       8
      13       8
      14       8
      15      12
      16      15
      17      15
      18      17
      19       1
      20       0
 
TOMS347_PRB
  Normal end of execution.
SHAR_EOF
fi # end of overwriting check
cd ..
if test ! -d 'Src'
then
	mkdir 'Src'
fi
cd 'Src'
if test -f 'src.f'
then
	echo shar: will not over-write existing file "'src.f'"
else
cat << "SHAR_EOF" > 'src.f'
      SUBROUTINE SORT ( A, II, JJ )
C
C  SORTS ARRAY A INTO INCREASING ORDER, FROM A(II) TO A(JJ).
C  ORDERING IS BY INTEGER SUBTRACTION, THUS FLOATING POINT
C  NUMBERS MUST BE IN NORMALIZED FORM.
C  ARRAYS IU(K) AND IL(K) PERMIT SORTING UP TO 2**(K+1)-1 ELEMENTS.
C
      IMPLICIT NONE

      INTEGER A(*)
      INTEGER I
      INTEGER II
      INTEGER IJ
      INTEGER IL(16)
      INTEGER IU(16)
      INTEGER J
      INTEGER JJ
      INTEGER K
      INTEGER L
      INTEGER M
      INTEGER T
      INTEGER TT

      M = 1
      I = II
      J = JJ
5     IF ( I .GE. J ) GO TO 70
10    K = I
      IJ = ( J + I ) / 2
      T = A(IJ)
      IF ( A(I) .LE. T ) GO TO 20
      A(IJ) = A(I)
      A(I) = T
      T = A(IJ)
20    L = J
      IF ( A(J) .GE. T ) GO TO 40
      A(IJ) = A(J)
      A(J) = T
      T = A(IJ)
      IF ( A(I) .LE. T ) GO TO 40
      A(IJ) = A(I)
      A(I) = T
      T = A(IJ)
      GO TO 40
30    A(L) = A(K)
      A(K) = TT
40    L = L - 1
      IF ( A(L) .GT. T ) GO TO 40
      TT = A(L)
50    K = K + 1
      IF ( A(K) .LT. T ) GO TO 50
      IF ( K .LE. L ) GO TO 30
      IF ( L - I .LE. J - K ) GO TO 60
      IL(M) = I
      IU(M) = L
      I = K
      M = M + 1
      GO TO 80
60    IL(M) = K
      IU(M) = J
      J = L
      M = M + 1
      GO TO 80
70    M = M - 1
      IF ( M .EQ. 0 ) RETURN
      I = IL(M)
      J = IU(M)
80    IF ( J - I .GE. II ) GO TO 10
      IF ( I .EQ. II ) GO TO 5
      I = I - 1
90    I = I + 1
      IF ( I .EQ. J ) GO TO 70
      T = A(I+1)
      IF ( A(I) .LE. T ) GO TO 90
      K = I
100   A(K+1) = A(K)
      K = K - 1
      IF ( T .LT. A(K) ) GO TO 100
      A(K+1) = T
      GO TO 90
      END
SHAR_EOF
fi # end of overwriting check
cd ..
cd ..
cd ..
#       End of shell archive
exit 0
