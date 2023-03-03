#' Calculate the time zone offtet from your system
#' It is required to calculate javascript ticks.
#' Source:
#' https://stackoverflow.com/questions/7966559/how-to-convert-javascript-date-object-to-ticks
#'
#' @return time zone offset in hours. Integer.
#' @noRd
#' @keywords internal
calculate_tz_offset <- function(){
  date <- Sys.time()
  date_utc <- as.POSIXct(format(date, tz = "UTC"))
  offset <- date_utc - date
  ans <- as.numeric(round(offset))
  return(ans)
}
