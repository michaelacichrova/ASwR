#!/bin/bash
#PBS -N EX4
#PBS -l select=1:ncpus=128,walltime=00:05:00
#PBS -q qexp
#PBS -e EX4.e
#PBS -o EX4.o

pwd

module load R
echo "loaded R"

time mpirun Rscript EX4.r 8
time mpirun Rscript EX4.r 16
