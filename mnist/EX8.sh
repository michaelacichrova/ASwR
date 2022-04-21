#!/bin/bash
#PBS -N Ex8
#PBS -l select=2:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e EX8.e
#PBS -o EX8.o

cd ~/ASwR/mnist
pwd

module load R
echo "loaded R"

time Rscript EX8.R

time mpirun --map-by ppr:32:node Rscript EX8.R