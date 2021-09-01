# djgpp-docker

Docker image for the DJGPP cross compiler to allow building MS-DOS applications from Unix.

This uses the build scripts written by Andrew Wu: https://github.com/andrewwutw/build-djgpp

You can pull from `djfdyuruiry/djgpp`: https://hub.docker.com/r/djfdyuruiry/djgpp

Environment:

  - Ubuntu 21.04 LTS base
  - GCC v7.0.2
  - DJGPP gcc/g++ binaries are setup in the PATH

----

## Building

You can rebuild this image if you want to change the GCC version used. Simply check out this repo and run:

```
./build.sh "<GCC_VERSION>"
```

*Note: this will take a long time, up to 1 hour on some machines, as it rebuilds GCC/G++ and associated toolchains from source*
