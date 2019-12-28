implicit real*8(a-h, o-z)
data i/1/, tol/0.05/

f(x) = x**3 - 3*x - 1
f_prime(x) = 3*x**2 - 3

x_old = 1.1
x = x_old
x_new = 100

do while (abs( (x_new - x_old) / x_new) > tol)
    x_new = x - f(x) / f_prime(x)
    x_old = x
    x = x_new
    write(*,*)' at ', i,' -th iteration The Newton & iterate = ', x
    i = i + 1
    if (i > 500) stop 500
end do

stop
end