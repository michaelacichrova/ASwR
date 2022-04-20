@@ -86,18 +86,19 @@ model_report = function(models, kplot = 0) {
  }
}

cat("Read and set up MNIST data:\n")
system.time(source("../mnist/mnist_read.R"))
source("../code/flexiblas_setup.r")
setback("OPENBLAS")
setthreads(4)
library(parallel)
library(ggplot2)
source("../mnist/mnist_read.R")
source("../code/flexiblas_setup.r")
blas_threads = as.numeric(commandArgs(TRUE)[2])
fork_cores = as.numeric(commandArgs(TRUE)[3])
setback("OPENBLAS")
setthreads(blas_threads)

## Begin CV (This CV is with mclapply. Exercise 8 needs MPI parallelization.)
## set up cv parameters
nfolds = 10
pars = seq(80.0, 95, 0.2)      ## par values to fit
pars = seq(80.0, 95, .2)      ## par values to fit
folds = sample( rep_len(1:nfolds, nrow(train)), nrow(train) ) ## random folds
cv = expand.grid(par = pars, fold = 1:nfolds)  ## all combinations

@@ -110,21 +111,26 @@ fold_err = function(i, cv, folds, train) {
  sum(predicts != train_lab[fold])
}

## apply fold_err over parameter combinations
## apply fold_err() over parameter combinations
cv_err = mclapply(1:nrow(cv), fold_err, cv = cv, folds = folds, train = train,
                  mc.cores = 32)
                  mc.cores = fork_cores)

## sum fold errors for each parameter value
cv_err_par = tapply(unlist(cv_err), cv[, "par"], sum)

## plot cv curve with loess smoothing (ggplot default)
ggplot(data.frame(pct = pars, error = cv_err_par/nrow(train)), aes(pct, error)) +
  geom_point() + geom_smooth() + labs(title = "Loess smooth with 95% CI of crossvalidation")
pdf("Crossvalidation.pdf")
  ggplot(data.frame(pct = pars, error = cv_err_par/nrow(train)), 
         aes(pct, error)) + geom_point() + geom_smooth() +
    labs(title = "Loess smooth with 95% CI of crossvalidation")
dev.off()
## End CV

## recompute with optimal pct
models = svdmod(train, train_lab, pct = 85)
model_report(models, kplot = 9)
pdf("BasisImages.pdf")
  model_report(models, kplot = 9)
dev.off()
predicts = predict_svdmod(test, models)
correct <- sum(predicts == test_lab)
cat("Proportion Correct:", correct/nrow(test), "\n")
