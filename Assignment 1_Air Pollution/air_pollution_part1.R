install.packages("data.table")
library("data.table")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"))
  
  lst <- lapply(fileNames, data.table::fread)
  dt<- rbindlist(lst)
  
  if (c(pollutant %in% names(dt))){
    return(dt[, lapply(.SD, mean,,na.m = TRUE), .SDcols = pollutant][[1]])
  }
}

pollutantmean(directory = "C:/Users/DELL/Documents/Documents/rprog_data_specdata", pollutant = 'sulfate', id = 20)

