#PBS -N EX8
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e EX8.e
#PBS -o EX8.o

cd ~/ASwR
pwd

module load R
echo "loaded R"

time Rscript EX4.r 128
echo "loaded R"

## --args blas fork
time Rscript RX8.R --args 4 32
