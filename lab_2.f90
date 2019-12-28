program lab_2
    implicit none

    integer A(1229) ! (a) 터미널 출력 가시성을 높이기 위한 배열 생성
    integer B(1229) ! (b) 터미널 출력 가시성을 높이기 위한 배열 생성

    integer :: n_a, n_b, i, t
    n_a = 0
    n_b = 0

    ! (a) 배열에 prime 할당
    t = 1
    do i = 1, 10000
        if (is_prime_a(i, n_a) .eqv. .true.) then
            A(t) = i
            t = t+1
        end if
    end do
    
    
    ! (b) 배열에 prime 할당
    t = 1
    do i = 1, 10000
        if (is_prime_b(i, n_b) .eqv. .true.) then
            B(t) = i
            t = t+1
        end if
    end do


    ! (a) 결과 출력
    print *, "(a) 방법을 사용하여 1 ~ 10000 까지의 소수 출력"
    write (*, '(35i5)') (A(i), i=1, 1229)
    write(*,*)
    print *, "(a) 방법을 사용했을 때 정수로 나눈 횟수는 : ", n_a

    write (*,*)

    ! (b) 결과 출력
    print *, "(b) 방법을 사용하여 1 ~ 10000 까지의 소수 출력"
    write (*, '(35i5)') (B(i), i=1, 1229)
    write(*,*)
    print *, "(b) 방법을 사용했을 때 정수로 나눈 횟수는 : ", n_b

contains
    
    function is_prime_a(j, n)

        logical :: is_prime_a
        integer, intent(in) :: j
        integer :: n

        integer :: k

        is_prime_a = .false.

        if (j == 1) then
            return
        
        else if (j == 2) then
            n = 1

        else
            do k = 2, j-1
                if (mod(j,k) == 0) then
                    n = n + 1
                    return
                end if
                n = n + 1
            end do
        end if

        is_prime_a = .true.

    end function is_prime_a


    function is_prime_b(j, n)
        logical :: is_prime_b
        integer, intent(in) :: j
        integer :: n
        
        integer :: k
        
        integer :: m
        m = int(sqrt(real(j)))
        is_prime_b = .false.

        if (j == 1) then
            return

        else if (j == 2 .or. j == 3) then
            is_prime_b = .true.
            return

        else
            do k = 2, m
                if (mod(j,k) == 0) then
                    n = n + 1
                    return
                end if
                n = n + 1
            end do
        end if

        is_prime_b = .true.

    end function is_prime_b    

end program lab_2