program example_checksum

    use checksum_module, only: checksum, read_whole_file
    implicit none

100 format(a, t50, i0)
    print 100, "checksum(""hello world""):", checksum('hello world')
    print 100, "checksum(read_whole_file(""./src/checksum.f90"")):", &
        checksum(read_whole_file('./src/checksum.f90'))

end program example_checksum
!> checksum("hello world"):                         436929629
!> checksum(read_whole_file("./src/checksum.f90")): -750348609