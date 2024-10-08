corr <- function(directory, threshold = 0) {
  
  lst <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  dt <- rbindlist(lst)
  
  dt <- dt[complete.cases(dt),]
  
  dt <- dt[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(dt[, corr])
}

corr(directory = '~/Desktop/specdata', threshold = 150)