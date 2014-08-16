program code1
	use mathlib
	implicit none
	real :: val1
	real, dimension(4, 4) :: b, val2
	b = reshape((/1, 2, 3, 4, 5, 6, 1 ,2 ,2,1,2,3,4,5,6,7/),shape(b))
	val1 = det(b)
	val2 = inv(b)
	print*,'Determinant of the matrix is : ', val1
	print*,'Inverse of the matrix is : '
	call printmat2d(val2)

end program code1