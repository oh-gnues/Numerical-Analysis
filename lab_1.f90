program lab_1
    implicit none

    Character(20) :: I
    
    print *, "Enter the integer : "
    read *, I
    
    print *, is_palindrome(trim(I))

contains

    function is_palindrome(i)
        logical :: is_palindrome
        character(len = *), intent(in) :: i

        integer :: m, l

        l = len(i)
        is_palindrome = .false.

        do m = 1, l/2
            if ( i(m : m) /= i(l-m+1 : l-m+1) ) return
        end do

        is_palindrome = .true.

        
    end function is_palindrome

end program lab_1