rm(list=ls())
# Make line plots for training and validation errors

output_dir = '/home/rohit/Dropbox/Research/SPLN/new_pln_results_jan11/a2/rplots2'

datasets = c('REDWINEQUALITY', 'WHITEWINEQUALITY', 'TWOD', 'SPIRAL_REG', 'OH7')
opts = c('dm', 'mk', 'w')
fold <- 1

datasets = c('SPIRAL_REG')
fold <- 8

toFile <- F

for(dataset in datasets) {
  print(dataset)
  i <- 1
  for(opt in opts) {
    print(opt)

    fname <- sprintf('/home/rohit/Dropbox/Research/SPLN/new_pln_results_jan11/a2/csv_out/%s_%d_%s_optimization.csv', dataset, fold, opt)
    plotname <- file.path(output_dir, sprintf('%s_%d_%s_optimization.eps', dataset, fold, opt))
    d <- read.csv(fname, header=F)
    x <- 1:nrow(d)
    
    if(toFile) {
      setEPS()
      postscript(plotname, width = 4.5, height = 5, horizontal = FALSE, onefile = FALSE, paper = "special")
    }# atop(N[it],paste('(',letters[i],')'))
    u <- paste('(',letters[i],')')
    matplot(x,d,type="l",lwd=2,lty=1:ncol(d),col=1:ncol(d),xlab=bquote('Iteration number' ~ (N[it])),ylab="Mean squared error")
    legend("topright",legend=c(expression(MSE[TRAINING]), expression(MSE[VALIDATION])),lty=1:ncol(d),col=1:ncol(d))
    mtext(u, side=1, line=4)
    if(toFile) {
      dev.off()
    }
    
    i <- i + 1
  }
}

# c(expression(MSE[TRAINING]), expression(MSE[VALIDATION]))