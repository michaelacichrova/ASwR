#!/bin/bash
#PBS -N mnist_svd_mv
#PBS -l select=2:mpiprocs=64,walltime=00:12:00
#PBS -q qexp
#PBS -e mnist_svd_mv.e
#PBS -o mnist_svd_mv.o

cd ~/ASwR/mnist
pwd

module load R
echo "loaded R"
export OMPI_MCA_mpi_warn_on_fork=0
export RDMAV_FORK_SAFE=1

module swap libfabric/1.12.1-GCCcore-10.3.0 libfabric/1.13.2-GCCcore-11.2.0

time mpirun --map-by ppr:32:node Rscript mnist_svd_mv.R

