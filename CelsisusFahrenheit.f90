program CelsiusFahrenheit

    implicit none
    real :: Celsius, Fahrenheit

    ! Get values for Celsius.
    print *, "Enter the (degree) of the temperature"
    read *, Celsius

    ! Compute the amount remaining at the specified time
    Fahrenheit = (9.0/5.0) * Celsius + 32

    ! Display Temperature
    print *, Celsius, "degrees Celsius = ", Fahrenheit, "degrees Fahrenheit"
end program CelsiusFahrenheit