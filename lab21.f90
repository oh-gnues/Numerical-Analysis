program lab21
    implicit real*8(a-h, o-z)
    f(x) = x**3 - cos(x)
    f_prime(x) = 3*x**2 + sin(x)

    tol = 1.e-8
    x0 = 0.
    x1 = 1.
    i = 0

    write(*,*) "Bisection method for 3 steps"
    write(*,*) "        steps        x0                       xm                      x1 "
    write(*,*) ""
    do while (i < 3)
        i = i + 1
        y0 = f(x0)
        y1 = f(x1)
        xm = (x0 + x1) / 2.
        ym = f(xm)
        
        if (ym .eq. 0.) then
            write(*,*) xm, ' is the root'
            stop
        else if (ym * y0 .gt. 0) then
            x0 = xm
        else
            x1 = xm
        end if

        write(*,*) i, x0, xm, x1
    end do
    
    write(*,*) ""
    write(*,*) "The Bisection method step is finished."
    write(*,*) "x0 = ", x0
    write(*,*) "x1 = ", x1
    write(*,*) ""

    j = 0
    xnew = 100

    do while (abs((x1 - x0) / x1) > tol)
        j = j + 1
        xnew = x0 - f(x0) / f_prime(x0)
        x0 = x1
        x1 = xnew

        write(*,*) "at ", i, " -th iteration The Newton iterate = ", x1
    end do

    ! root = (x0+x1) / 2.
    write(*,*)
    write(*,*) x1, ' is the root'

end program lab21