pollutantmean <- function(directory, pollutant, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  meanList <- NA
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
    meanList <- c(meanList, data[!is.na(data[pollutant]), pollutant])
  }
  return(round(mean(meanList[!is.na(meanList)]), 3))
}
