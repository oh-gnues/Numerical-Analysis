program palindro
    implicit none

    character(len=*), parameter :: p = "ingirumimusnocteetconsumimurigni"
    character :: input

    read *, input
    print *, is_palindro(input)

    print *, is_palindro(p)
    print *, is_palindro("121124") ! F

contains

    function is_palindro(t)
        logical :: is_palindro
        character(len=*), intent(in) :: t
        
        integer :: i, l
        
        l = len(t)
        is_palindro = .false.
        do i=1, l/2
            if ( t(i:i) /= t(l-i+1:l-i+1) ) return
        end do
        is_palindro = .true.

    end function is_palindro

end program palindro