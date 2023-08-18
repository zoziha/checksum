!> checksum: a module to calculate checksum of a string
module checksum_module

    implicit none

    private
    public :: adler32, read_whole_file, checksum

    !> interface for Adler-32 checksum
    interface checksum
        module procedure :: adler32
    end interface checksum

contains

    !> Adler-32 checksum
    integer pure function adler32(string)
        character(*), intent(in) :: string
        integer :: i, s1, s2
        integer, parameter :: MOD_ADLER = 65521  ! largest prime smaller than 65536

        s1 = 1
        s2 = 0

        do i = 1, len(string)
            s1 = mod(s1 + ichar(string(i:i)), MOD_ADLER)
            s2 = mod(s2 + s1, MOD_ADLER)
        end do

        adler32 = shiftl(s2, 16) + s1

    end function adler32

    !> read the file as a string
    function read_whole_file(file) result(string)
        character(*), intent(in) :: file  !! file name to read
        character(:), allocatable :: string  !! file content
        integer :: iunit, len, stat, i

        open (newunit=iunit, file=file, status='old', action='read')
        inquire (iunit, size=len)
        allocate (character(len=len) :: string)

        do i = 1, len - 1
            read (iunit, '(a1)', advance='no', iostat=stat) string(i:i)
            if (is_iostat_eor(stat)) string(i:i) = char(10)  !! line feed
        end do
        string(len:len) = char(0)  !! null character

        close (iunit)

    end function read_whole_file

end module checksum_module
