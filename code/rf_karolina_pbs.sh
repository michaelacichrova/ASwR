#!/bin/bash
#PBS -N rf
#PBS -l select=1:ncpus=128,walltime=00:05:00
#PBS -q qexp
#PBS -e rf.e
#PBS -o rf.o

cd ~/ASwR/code
pwd

module load R
echo "loaded R"

time Rscript rf_serial.r
time Rscript rf_mc.r 1 --args 1
time Rscript rf_mc.r 2 --args 2
time Rscript rf_mc.r 4 --args 4
time Rscript rf_mc.r 8 --args 8
time Rscript rf_mc.r 16 --args 16
time Rscript rf_mc.r 32 --args 32
time Rscript rf_mc.r 64 --args 64
time Rscript rf_mc.r 128 --args 128

