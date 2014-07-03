complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  nobs <- NA
  for (i in id) {
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
    nobs <- c(nobs, length(data[!is.na(data[2]) & !is.na(data[3]), 4]))
  }
  nobs <- nobs[!is.na(nobs)]
  return(data.frame(id, nobs))
}