program Calculate_Circle

    implicit none

    real :: diameter, radius, circumference, area
    real, parameter :: pi = 3.1415927

    ! Get a value for diameter.
    print *, "Enter the diameter (cm) of the circle : "
    read *, diameter

    ! Compute the values which we want to know.
    radius = diameter / 2
    circumference = diameter * pi
    area = pi * radius ** 2

    ! Display the results
    print *, "Radius=", radius, "cm"
    print *, "Circumference=", circumference, "cm"
    print *, "Area=", area, "cm2"
    
end program Calculate_Circle