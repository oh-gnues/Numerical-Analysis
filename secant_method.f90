implicit real*8(a-h, o-z)
data i/1/, tol/0.05/

f(x) = x**3 - 3*x - 1

write(*, *) "-- Enter initial points --"
read(*, *) x0, x1

y0 = f(x0)
y1 = f(x1)

do while ( abs(x1-x0) > tol)
    xnew = x1 - y1 * (x1-x0) / (y1-y0)
    write(*, *) ' at', i, '-th iteration x_i = ', xnew
    i = i + 1
    x0 = x1
    y0 = y1
    x1 = xnew
    y1 = f(x1)
    if (i > 500) stop 500
end do

write(*,*) ' The function value at this point = ', fval

stop
end