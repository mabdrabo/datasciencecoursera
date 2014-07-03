rankhospital <- function(state, outcome, num = "best") {
  #   Hospital Name 2
  #   State 7
  #   Heart Attack 11
  #   Heart Failure 17
  #   Pneumonia 23
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  temp <- data[data[, 7] == state,]
  if (nrow(temp) > 0)
    data <- temp
  else
    stop("invalid state")
  
  switch(outcome,
         'heart attack' = index <- 11,
         'heart failure' = index <- 17,
         pneumonia = index <- 23,
         stop("invalid outcome"))
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data <- data[!is.na(data[, index]),]
  data[,index] <- as.numeric(data[,index])
  data_order <- order(data[, index], data[, 2])

  if (is.numeric(num))
    hospName <- data[data_order[num], 2]
  else if (num == "best")
    hospName <- data[head(data_order, 1), 2]
  else
    hospName <- data[tail(data_order, 1), 2]
  
  hospName
}