program temp
    implicit none

    real :: A(3,3)
    real :: B(3,1)
    real :: C(3,1)
    integer :: k, i, j

    do i = 1, 3
        do j = 1, 3
            A(i, j) = k
            k = k + 1
        end do
    end do

    B(1,1) = 100
    B(2,1) = 200
    B(3,1) = 300

    C = matmul(A, B)

    write (*,*) C(1,1), C(2,1), C(3,1)

contains

    subroutine plus(i)
        integer :: i
        i = i + 1000
    end subroutine

    function test(M, size)
        implicit none
        integer :: size, i, j, k, v
        real :: M(size, size), test(size, size)
        
        k = 500
        v = 100
        do i = 1, 3
            do j = 1, 3
                test(i, j) = k
                M(i, j) = v
                k = k + 1
                v = v + 1
            end do
        end do

    end function test

end program