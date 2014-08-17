program code1
	use mathlib
	implicit none
	real :: val1
	real, dimension(3, 3) :: b, val2
	b = reshape((/1, 2, 3, 4, 5, 6, 1 ,2 ,2/),shape(b))
	val1 = det(b)
	val2 = inv(b)
	print*,'Determinant of the matrix is : ', val1
	print*,'Inverse of the matrix is : '
	call printmat2d(val2)

end program code1
