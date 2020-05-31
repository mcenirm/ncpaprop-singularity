# ncpaprop-singularity

1. `make`


## Notes

One of the goals is to build _petsc_ without MPI support.
_ncpaprop_'s `--disable-localpetscmpi` does nothing,
so we have to build _petsc_ first and disable MPI.
