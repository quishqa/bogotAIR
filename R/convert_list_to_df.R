#' Convert list into a data frame
#' Convert the list from a JSON into a data frame with
#' date as POSXICt, and parameters in numeric.
#'
#' @param data_list
#'
#' @return data from air quality station in data frame.
#' @noRd
#' @keywords internal
convert_list_to_df <- function(data_list){
  data <- lapply(data_list, unlist)
  data_df <- do.call("rbind", data)
  data_df[data_df == "----"] <- NA
  data_df <- as.data.frame(data_df)
  names(data_df) <- c("date", "pm10", "no", "no2", "nox",
                      "ws", "wd", "tc", "pp", "pm2.5",
                      "o3", "co", "so2")
  data_df$date <- as.POSIXct(strptime(data_df$date,format = "%d-%m-%Y %H:%M"),
                             tz = "America/Bogota")
  data_df[, 2:ncol(data_df)] <- sapply(data_df[, 2:ncol(data_df)],
                                       as.numeric)
  return(data_df)
}
