program prime

    implicit none
    
    integer :: num_primes, at, found, i
    logical :: is_prime
    integer, allocatable, dimension(:) :: primes ! array that will hold the primes

    print *,"How many primes would you like to find?"
    read(*,*)num_primes
    
    allocate(primes(num_primes))
    
    primes(1)=2
    
    at =2
    
    found =1
    
    do
    
    is_prime=. true . ! assume prime
    
    do i =1,found
    
    if(modulo(at,primes(i))==0) then ! if divisible by any other element
    
    is_prime = . false. ! in the array, then not prime
    
    exit
    
    end if
    
    end do
    
    if(is_prime) then
    
    found = found +1
    
    primes(found)=at
    
    print *, at
    
    end if
    
    at = at + 1
    
    if(found==num_primes) then ! stop when all primes are found
    
    exit
    
    end if
    
    end do
    
    end program prime