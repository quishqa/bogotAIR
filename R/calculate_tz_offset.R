calculate_tz_offset <- function(){
  date <- Sys.time()
  date_utc <- as.POSIXct(format(date, tz = "UTC"))
  offset <- date_utc - date
  ans <- as.numeric(round(offset))
  return(ans)
}
