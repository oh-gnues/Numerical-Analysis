PROGRAM lab22
    IMPLICIT REAL*8(a-h, o-z)

    REAL :: A(100, 100), B(200, 200), C(500, 500)
    REAL :: A_H(100, 100), B_H(200, 200), C_H(500, 500)
    REAL :: A_inv(100, 100), B_inv(200, 200), C_inv(500, 500)
    REAL :: A_cond_inf, B_cond_inf, C_cond_inf

    A = hilbert_matrix(100)
    A_H = A
    A_inv = inverse(A_H, 100)
    A_cond_inf = cond_inf(A, A_inv, 100)

    ! write(*,*) "Hilbert Matrix 100 X 100"
    ! call print_matrix(A, 100)
    ! write(*,*) "Inversed Hilbert Matrix 100 X 100"
    ! call print_matrix(A_inv, 100)
    write(*,*) "Condition Number with respect to infinite norm of Hibert Matrix 100 X 100"
    write(*,*) A_cond_inf

    B = hilbert_matrix(200)
    B_H = B
    B_inv = inverse(B_H, 200)
    B_cond_inf = cond_inf(B, B_inv, 200)

    ! write(*,*) "Hilbert Matrix 200 X 200"
    ! call print_matrix(B, 200)
    ! write(*,*) "Inversed Hilbert Matrix 200 X 200"
    ! call print_matrix(B_inv, 200)
    write(*,*) "Condition Number with respect to infinite norm of Hibert Matrix 200 X 200"
    write(*,*) B_cond_inf

    C = hilbert_matrix(500)
    C_H = C
    C_inv = inverse(C_H, 500)
    C_cond_inf = cond_inf(C, C_inv, 500)

    ! write(*,*) "Hilbert Matrix 500 X 500"
    ! call print_matrix(C, 500)
    ! write(*,*) "Inversed Hilbert Matrix 500 X 500"
    ! call print_matrix(C_inv, 500)
    write(*,*) "Condition Number with respect to infinite norm of Hibert Matrix 500 X 500"
    write(*,*) C_cond_inf
    
contains

    function hilbert_matrix(size)
        implicit none
        integer :: size, i, j
        real :: hilbert_matrix(size, size)
        do i = 1, size
            do j = 1, size
                hilbert_matrix(i, j) = 1. / (i+j-1)
            end do
        end do
    end function hilbert_matrix
    
    function inverse(M, n)
        implicit none
        integer :: n, i, j
        real :: inverse(n,n)
        real :: inv(n,n), M(n,n), tmp, temp

        do i = 1, n
            do j = 1, n
                inv(i, j) = 0.
            end do
            inv(i,i) = 1.
        end do

        do i = 1, n
            tmp = M(i,i)
            M(i, :) = M(i, :) / tmp
            inv(i, :) = inv(i, :) / tmp
            do j = 1, n
                if (j == i) then
                    continue
                else
                    temp = -M(j,i)
                    M(j, :) = M(j, :) + (M(i, :) * temp)
                    inv(j, :) = inv(j, :) + (inv(i, :) * temp)
                endif
            end do
        end do

        inverse = inv
    end function

    function norm_inf(M, n)
        implicit none
        integer :: n, i
        real :: max
        real :: M(n,n)
        real :: norm_inf

        max = sum(abs(M(1, :)))
        do i = 2, n
            if (max < sum(abs(M(i, :)))) then
                max = sum( abs( M(i, :) ) )
            end if
        end do
        norm_inf = max

    end function norm_inf
    
    function cond_inf(M, M_inv, n)
        implicit none
        integer :: n
        real :: M(n,n), M_inv(n,n)
        real :: cond_inf

        cond_inf = norm_inf(M, n) * norm_inf(M_inv, n)
    end function cond_inf

    subroutine print_matrix(M, n)
        implicit none
        integer :: n, i
        real :: M(n,n)
        do i = 1, n
            write(*,*) M(i, :)
        end do
        write(*,*)
    end subroutine

end program lab22