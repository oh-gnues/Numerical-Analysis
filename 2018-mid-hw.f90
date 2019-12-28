real function find(N, A)
    implicit real*8(a-h, o-z)
    real :: A(N,N)
    real :: max
    integer :: N, i, j
    max = 0
    i = 0

    do while(i < N)
        i = i + 1
        j = 0
        do while(j < N) 
            j = j + 1
            if (abs(A(i, j)) > max) then
                max = abs(A(i,j))
            end if
        end do
    end do

    find = max
return
end