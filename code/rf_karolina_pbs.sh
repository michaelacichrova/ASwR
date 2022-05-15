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
<<<<<<< HEAD
time Rscript rf_mc.r 1
time Rscript rf_mc.r 2
time Rscript rf_mc.r 8
time Rscript rf_mc.r 16
time Rscript rf_mc.r 32
time Rscript rf_mc.r 64
time Rscript rf_mc.r 128

=======
time Rscript rf_mc.r --args 1
time Rscript rf_mc.r --args 2
time Rscript rf_mc.r --args 4
time Rscript rf_mc.r --args 8
time Rscript rf_mc.r --args 16
time Rscript rf_mc.r --args 32
time Rscript rf_mc.r --args 64
time Rscript rf_mc.r --args 128
>>>>>>> upstream/master
