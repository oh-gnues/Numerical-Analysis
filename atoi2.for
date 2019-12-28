Last login: Mon Oct  7 14:44:25 on ttys001
 kimseungho@MacBook-Pro  ~  ls
Applications
Desktop
Documents
Downloads
Dropbox
Google 드라이브
Library
Movies
Music
  1
OneDrive - 한양대학교
  1
Pictures
  1 program atoi
Public
Samsung
VirtualBox VMs
anaconda3
dev
eclipse
iCloud Drive(아카이브)
webapp
zsh-syntax-highlighting
 kimseungho@MacBook-Pro  ~  cd dev
 kimseungho@MacBook-Pro  ~/dev  ls
Python_Practice class           oss             webapp          webfinal
ai              fortran         web             webapp_practice
 kimseungho@MacBook-Pro  ~/dev  cd fortran
 kimseungho@MacBook-Pro  ~/dev/fortran  ls
3.f90                  ex.f90                 lab_3.f90
Calculate_Circle.f90   fort.1234              practice1.f90
CelsisusFahrenheit.f90 int.f90                practice2.f90
a.out                  lab_1.f90              prime.f90
ans.f90                lab_2-result           test
atoi.for               lab_2.f90              test.f90
 kimseungho@MacBook-Pro  ~/dev/fortran  vim atoi2.for
 kimseungho@MacBook-Pro  ~/dev/fortran  vim atoi2.for
  1 program atoi
 kimseungho@MacBook-Pro  ~/dev/fortran  vim atoi2.for
 kimseungho@MacBook-Pro  ~/dev/fortran  gfortran atoi2.for
atoi2.for:1:1:

 program atoi
 1
Error: Non-numeric character in statement label at (1)
atoi2.for:1:1:

 program atoi
 1
Error: Unclassifiable statement at (1)
atoi2.for:18:1:

 end program
 1
Error: Non-numeric character in statement label at (1)
atoi2.for:18:1:

 end program
 1
Error: Unclassifiable statement at (1)
f951: Error: Unexpected end of file in ‘atoi2.for’
  1 program atoi
 ✘ kimseungho@MacBook-Pro  ~/dev/fortran  vim atoi2.for
 kimseungho@MacBook-Pro  ~/dev/fortran  gfortran atoi2.for
atoi2.for:1:1:

 program atoi
 1
Error: Non-numeric character in statement label at (1)
atoi2.for:1:1:

 program atoi
 1
Error: Unclassifiable statement at (1)
atoi2.for:18:1:

 end
 1
Error: Non-numeric character in statement label at (1)
atoi2.for:18:1:

 end
 1
Error: Unclassifiable statement at (1)
f951: Error: Unexpected end of file in ‘atoi2.for’
 ✘ kimseungho@MacBook-Pro  ~/dev/fortran  vim atoi2.for
 kimseungho@MacBook-Pro  ~/dev/fortran  gfortran atoi2.for
atoi2.for:1:1:

 program atoi
 1
Error: Non-numeric character in statement label at (1)
atoi2.for:1:1:

 program atoi
  1 program atoi
  2     implicit none
  3
  4     character*(*) field
  5     integer ios
  6     character*11 buffer
  7     common /txterr/ ios
  8     if (len(field).LT.11) then
  9         buffer = field
 10         read (buffer, '(BN,
~
~
~
~
~
~
~
~
~
~
~
~
~
 10:28 [All]                                        [+] ~/dev/f
