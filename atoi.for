C  Return an integer from the field
      integer function atoi (field)
      implicit none
      character*(*) field
      integer ios
      character*11 buffer
      common /txterr/ ios
      if (len(field).LT.11) then
         buffer = field
         read (buffer,'(BN,I11)',iostat=ios) atoi
      else
         read (field,'(BN,I11)',iostat=ios) atoi
      end if
      return
      end
