@@ -11,6 +11,5 @@ pwd
module load R
echo "loaded R"

time Rscript mnist_svd_cv.R


## --args blas fork
time Rscript mnist_svd_cv.R --args 4 32
