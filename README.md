# Checksum

![Language](https://img.shields.io/badge/-Fortran-734f96?logo=fortran&logoColor=white)
[![license](https://img.shields.io/badge/License-MIT-pink)](LICENSE)

A simple checksum module, generally used to check if an ASCII file has changed.

Only FPM is supported, other build systems can copy the source file (`./src/checksum.f90`) directly.

> **Warning**
>
> There may be potential errors in this module, feedback and contributions are welcome.

## Usage

To use `checksum` within your `fpm` project, add the following lines to your `fpm.toml` file:

```toml
[dependencies]
checksum = { git="https://github.com/zoziha/checksum" }
```

## Example

```sh
> fpm run --example --all  # run the example
```

```fortran
program example_checksum

    use checksum_module, only: checksum, read_whole_file
    implicit none

100 format (a,t50,i0)
    print 100, "checksum(""hello world""):", checksum('hello world')
    print 100, "checksum(read_whole_file(""./src/checksum.f90"")):", &
        checksum(read_whole_file('./src/checksum.f90'))

end program example_checksum
!> checksum("hello world"):                         436929629
!> checksum(read_whole_file("./src/checksum.f90")): 1903669946
```
