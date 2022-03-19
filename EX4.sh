#!/bin/bash
#PBS -N EX4
#PBS -l select=1:ncpus=128,walltime=00:05:00
#PBS -q qexp
#PBS -e EX4.e
#PBS -o EX4.o

cd ~/ASwR-1
pwd

module load R
echo "loaded R"

time Rscript EX4.r 8
time Rscript EX4.r 16
time Rscript EX4.r 32
time Rscript EX4.r 64
time Rscript EX4.r 128
