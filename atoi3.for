program characterconversions

character*50 s
integer i
double precision d
logical t,f

s = '1234'
read (s,*) i

s = '1234.5678'
read (s,*) d

s = 'T' !TRUE
read (s,*) t

s = 'F' !FALSE
read (s,*) f

print *,i
print *,d
print *,t
print *,f

write (s, *) i
print *,s

write (s, *) d
print *,s

write (s, *) t
print *,s

write (s, *) f
print *,s

print '("Press any key to exit... "$)'
read (*,*)

end
