module mathlib
!===============================================================================
! Necessary mathematical functions
!
! List:
! 1. Determinant of a matrix [function]
! Info:
!		Syntax: value = det(a)
!		Result: Determinant of matrix 'a' is stored in 'value'
!		Description: LU decomposition is used for computation
!		Caution: Input only square matrices
!
! 2. Printing a 2-D matrix in rows and columns [subroutine]
! Info:
!		Syntax: call printmat2d(a)
!		Result: Matrix 'a' is printed in rows and columns
!
! 3. Inverse of a matrix [function]
! Info:
!		Syntax: inv(a)
!		Result: Returns inverse of matrix 'a'
!		Description: Utilizes LU decomposition and Row operations on U & L
!		Caution: Inverse of a singular matrix cannot be evaluated
!===============================================================================
	implicit none
contains
	function det(a)
	! Determinant of a matrix 'a'
		implicit none
		! Dimension of the input array
		integer :: dim1, dim2, n, i
		! Determinant
		real :: det
		real :: a(:,:)
		real, dimension(:,:), allocatable :: L, U
		dim1 = size(a,1)
		dim2 = size(a,2)
		if (dim1 == dim2) then
			! LU decomposition
			n = dim1
			allocate(L(n,n))
			allocate(U(n,n))
			call doLU(a,L,U)
			det=1
			do i=1,n
				det=det*U(i,i)
			end do
		else
			write(*,*) 'Determinant of a non-square matrix could not be obtained!'
			return
		end if
	end function det

	function inv(a)
	! Inverse of a matrix 'a'
		implicit none
		! Dimension of the input array
		integer :: dim1, dim2, n, i, j
		! Determinant
		real :: det
		real :: a(:,:)
		real, dimension(:,:), allocatable :: L, U, inv, LI, UI
		dim1 = size(a,1)
		dim2 = size(a,2)
		if (dim1 == dim2) then
			! LU decomposition : A=LU
			n = dim1
			allocate(L(n,n))
			allocate(U(n,n))
			call doLU(a,L,U)
			det=1
			do i=1,n
				det=det*U(i,i)
			end do
			if (det==0) then
				write(*,*) 'Matrix is singular!'
				return
			else
				allocate(inv(n,n))
				allocate(LI(n,n))
				allocate(UI(n,n))
				do i=1,n
					LI(i,i)=1
					UI(i,i)=1
				end do

				! Row operations on U
				do i=n,2,-1 ! Rows
					UI(i,:)=UI(i,:)/U(i,i)
					do j=(i-1),1,-1 ! rest rows
						UI(j,:)=UI(j,:)-UI(i,:)*U(j,i)
					end do
				end do
				UI(1,:)=UI(1,:)/U(1,1)

				! Row operations on L
				do i=1,(n-1) ! Rows
					LI(i,:)=LI(i,:)/L(i,i)
					do j=(i+1),n ! rest rows
						LI(j,:)=LI(j,:)-LI(i,:)*L(j,i)
					end do
				end do
				LI(n,:)=LI(n,:)/L(n,n)

				! Inverse of (LU) = inverse of U * inverse of L
				inv = matmul(UI,LI)
			end if
		else
			write(*,*) 'Determinant of a non-square matrix could not be obtained!'
			return
		end if

	end function inv

	subroutine doLU(a,L,U)
	! Doolittle algorithm for LU decomposition
	! LU decompostition of matrix 'a'
		implicit none
		real :: a(:,:), L(:,:), U(:,:)
		integer :: n, i, j, p
		real :: s, detold, detnew, tol
		real, parameter :: tole=10**(-5)
		n = size(a,1)
		L=0
		U=0
		detold=0
		tol=100 ! Initialization
		do while (tol>tole)
			do i=1,n
				L(i,i) = 1 ! Doolittle uniqueness
				! Loop for Uij
				do j=i,n
					s = a(i,j)
					p = 1
					do while (p<=(i-1))
						s = s-L(i,p)*U(p,j)
						p=p+1
					end do
					U(i,j) = s
				end do
				! Loop for Lij
				do j=1,(i-1)
					s = a(i,j)
					p = 1
					do while (p <= (j-1))
						s = s-L(i,p)*U(p,j)
						p=p+1
					end do
					L(i,j) = s/U(j,j)
				end do
			end do

			detnew=1
			do i=1,n
				detnew=detnew*L(i,i)*U(i,i)
			end do
			tol = abs((detnew-detold)/detold)
			detold=detnew
		end do
	end subroutine doLU
	
	subroutine printmat2d(a)
		! Prints matrix 'a' in a pretty format
		real :: a(:,:)
		integer :: dim1, row
		dim1=size(a,1)
		do row=1,dim1
			write(*,*) a(row,:)
		end do
		print*
	end subroutine printmat2d

end module mathlib