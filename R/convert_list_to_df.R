#' Convert list into a data frame
#' Convert the list from a JSON into a data frame with
#' date as POSXICt, and parameters in numeric.
#'
#' @param data_list
#'
#' @return data from air quality station in data frame.
#' @noRd
#' @keywords internal
convert_list_to_df <- function(data_list, aqs_code){
  data <- lapply(data_list, unlist)
  data_df <- do.call("rbind", data)
  data_df[data_df == "----"] <- NA
  data_df <- as.data.frame(data_df)
  names_df <- create_monitor_code(aqs_code, col_names = TRUE)
  names(data_df) <- c("date",
                      names_df$pol_names[names_df$id_names %in% names(data_df)])
  data_df$date <- as.POSIXct(strptime(data_df$date,format = "%d-%m-%Y %H:%M"),
                             tz = "America/Bogota")
  data_df[, 2:ncol(data_df)] <- sapply(data_df[, 2:ncol(data_df)],
                                       as.numeric)
  return(data_df)
}
