maths
=====
Module for FORTRAN 90

This is collection of useful matrix operators and other mathematical functions
Many more functions will be added as and when I will feel the need of it.

!===============================================================================
! File : mathlib.f90 [module]
!
! Necessary mathematical functions
!
! List:
! 1. Determinant of a matrix [function]
! Info:
! Syntax: value = det(a)
! Result: Determinant of matrix 'a' is stored in 'value'
! Description: LU decomposition is used for computation
! Caution: Input only square matrices
!
! 2. Printing a 2-D matrix in rows and columns [subroutine]
! Info:
! Syntax: call printmat2d(a)
! Result: Matrix 'a' is printed in rows and columns
!
! 3. Inverse of a matrix [function]
! Info:
! Syntax: inv(a)
! Result: Returns inverse of matrix 'a'
! Description: Utilizes LU decomposition and Row operations on U & L
! Caution: Inverse of a singular matrix cannot be evaluated
!===============================================================================
