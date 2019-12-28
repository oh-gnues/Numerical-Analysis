program lab_3
    implicit none
    
    integer A(100,100)
    integer :: i, j     ! i : 행, j : 열
    integer :: e        ! 랜덤 정수
    integer :: sum      ! sub-diagonal 의 합
    real :: r           ! 랜덤 실수 : 0.0 ~ 1.0

    sum = 0


    ! 행렬 모든 값을 0 으로 초기화
    do i = 1, 100
        do j = 1, 100
            A(i, j) = 0
        end do
    end do

    ! 삼중대각행렬 값 생성 (랜덤 정수)
    do i = 1, 100
        do j = i-1, i+1
            if (j /= 0 .and. j /= 101) then
                call random_seed()      ! 난수 시드 초기화
                call random_number(r)   ! 난수 생성 (r)
                e = floor(r*10 + 1)     ! 난수(실수)를 정수로 변환 (0이 되는 것을 방지하기 위해 + 1)
                A(i, j) = e
            end if
        end do
    end do

    ! 행렬 출력
    write (*,*)
    write (*,*) '100X100 사이즈의 Tridiagonal 행렬'
    do i = 1, 100
        write(*, '(100i3)') (A(i,j), j=1, 100)
    end do

    ! sub-diagonal 값 계산
    do i = 2, 100
        sum = sum + A(i, i-1)
    end do

    write(*,*)
    print *, "위 행렬의 sub-diagonal의 합은 : ", sum

end program lab_3