@@ -11,6 +11,5 @@ pwd
module load R
echo "loaded R"

time Rscript EX8.R


## --args blas fork
time Rscript RX8.R --args 4 32
