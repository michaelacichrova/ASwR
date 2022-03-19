#!/bin/bash
#PBS -N EX4
#PBS -l select=1:ncpus=128,walltime=00:05:00
#PBS -q qexp
#PBS -e EX4.e
#PBS -o EX4.o

pwd

module load R
echo "loaded R"

time mpirun -np 8 Rscript EX4.r
time mpirun -np 16 Rscript EX4.r
time Rscript -np 32 Rscript EX4.r
time Rscript -np 64 Rscript EX4.r
time Rscript -np 128 Rscript EX4.r
