# ncpaprop-singularity


## Build images

`make` will try to make all the images (determined by `*.def` files).

For example, `test.def` results in image `images/test.sif`.

Any `remote-*.def` files will be built by the [Sylabs remote builder](https://cloud.sylabs.io/builder).


## Use images

Running an image (ie, as a program, or using `singularity run ...`) will attempt to exec the command line arguments.
That is, the first argument needs to be a command, such as `Modess`:

    ./images/test.sif Modess ...

`/code/ncpaprop/bin/` is at the front of `$PATH`.


## Notes

One of the goals is to build _petsc_ without MPI support.
_ncpaprop_'s `--disable-localpetscmpi` does nothing,
so we have to build _petsc_ first and disable MPI.
