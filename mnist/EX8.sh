#!/bin/bash
#PBS -N EX8
#PBS -l select=2:mpiprocs=64,walltime=00:12:00
#PBS -q qexp
#PBS -e EX8.e
#PBS -o EX8.o

cd ~/ASwR/mnist
pwd

module load R
echo "loaded R"

export OMPI_MCA_mpi_warn_on_fork=0
export RDMAV_FORK_SAFE=1

module swap libfabric/1.12.1-GCCcore-10.3.0 libfabric/1.13.2-GCCcore-11.2.0

## --args blas fork

time mpirun --map-by ppr:32:node Rscript EX8.r
