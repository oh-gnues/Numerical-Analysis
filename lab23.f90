PROGRAM lab23
    IMPLICIT REAL*8(a-h, o-z)
    ! REAL :: x, y, z
    REAL*8 :: X_old(3,1), X_new(3,1), Jacobian(3,3), Jacobian_inv(3,3), FF(3,1), X_now(3,1)
    integer :: j

    f(x,y,z) = x**2 + 2*y**2 + 4*z**2 - 7
    f_prime_x(x) = 2*x
    f_prime_y(y) = 4*y
    f_prime_z(z) = 8*z

    h(x,y,z) = x*y*z + 1
    h_prime_x(y, z) = y*z
    h_prime_y(x, z) = x*z
    h_prime_z(x, y) = x*y

    g(x,y,z) = 2*x**2 + y**3 + 6*z - 10
    g_prime_x(x) = 4*x
    g_prime_y(y) = 3*y**2
    g_prime_z = 6

    X_old(1,1) = 1.0
    X_old(2,1) = -1.
    X_old(3,1) = 1.2
    X_new(1,1) = 50.
    X_new(2,1) = 50.
    X_new(3,1) = 50.
    
    X_now = X_old

    j = 1
    tol = 1.e-8
    
    do while ( abs( (X_new(1,1) - X_old(1,1)) / X_new(1,1) )  > tol)
        Jacobian(1, 1) = f_prime_x(X_now(1,1))
        Jacobian(1, 2) = f_prime_y(X_now(2,1))
        Jacobian(1, 3) = f_prime_z(X_now(3,1))
        Jacobian(2, 1) = g_prime_x(X_now(1,1))
        Jacobian(2, 2) = g_prime_y(X_now(2,1))
        Jacobian(2, 3) = g_prime_z
        Jacobian(3, 1) = h_prime_x(X_now(2,1), X_now(3,1))
        Jacobian(3, 2) = h_prime_y(X_now(1,1), X_now(3,1))
        Jacobian(3, 3) = h_prime_z(X_now(1,1), X_now(2,1))
        
        Jacobian_inv = inverse(Jacobian, 3)
        FF(1,1) = f(X_now(1,1),X_now(2,1),X_now(3,1))
        FF(2,1) = g(X_now(1,1),X_now(2,1),X_now(3,1))
        FF(3,1) = h(X_now(1,1),X_now(2,1),X_now(3,1))

        X_new = X_now - matmul(Jacobian_inv, FF)
        X_old = X_now
        X_now = X_new

        write(*,*) j,'-th iteration The Newton & iterate =', X_now
        j = j + 1
    end do

    write(*,*)
    write(*,*) X_now, "is the root."

    contains

    function inverse(M, n)
        implicit none
        integer :: n, i, j
        real*8 :: inverse(n,n)
        real*8 :: inv(n,n), M(n,n), tmp, temp

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

END PROGRAM