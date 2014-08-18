maths
=====
#Module for FORTRAN 90

Also have a look at FORTRAN syntax package [MinimalFortran](https://github.com/315234/MinimalFortran) if you use Sublime text.

This is a collection of useful matrix operators and other mathematical functions. Many more functions will be added as and when I will feel the need of it.

##File : mathlib.f90 [module]

###Necessary mathematical functions

####List:
 1. Determinant of a matrix [function]
   - SYNTAX: *value = det(a,tole)*
   - RESULT: Determinant of matrix 'a' is stored in 'value' with tolerance of 10^(-tole)
   - DESCRIPTION: LU decomposition is used for computation
   - CAUTION: Input only square matrices

 2. Printing a 2-D matrix in rows and columns [subroutine]
   - SYNTAX: *call printmat2d(a)*
   - RESULT: Matrix 'a' is printed in rows and columns

 3. Inverse of a matrix [function]
   - SYNTAX: *inv(a,tole)*
   - RESULT: Returns inverse of matrix 'a' with tolerance of 10^(-tole)
   - DESCRIPTION: Utilizes LU decomposition and Row operations on U & L
   - CAUTION: Inverse of a singular matrix cannot be evaluated

- Remember to *use mathlib.f90* in the main program
