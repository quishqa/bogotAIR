date_in_json <- function(date){
  epoch <- as.numeric(date) * 10000 * 1000
  ticks <- 621355968000000000
  json_ticks <- epoch + ticks
  json_offset <- calculate_tz_offset() * 60  * 60000 * 10000
  json_date <- json_ticks - json_offset
  json_date <- format(json_date, scientific = FALSE)
  return(json_date)
}
