corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  corrs <- vector("numeric")
  for (i in 1:332) {
    if (i < 10) {
      fid <- paste("00", i, sep="")
    } else {
      if (i < 100) {
        fid <- paste("0", i, sep="")  
      } else {
        fid <- i
      }
    }
    data <- read.csv(paste(directory, "/", fid, ".csv", sep=""))
    data <- data[!is.na(data[2]) & !is.na(data[3]), ]
    if (nrow(data) > threshold) {
      corrs <- append(corrs, round(cor(data[,'sulfate'], data[,'nitrate']), 5))
    }
  }
  return(corrs)
}
