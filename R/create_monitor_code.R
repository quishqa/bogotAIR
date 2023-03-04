#' Create the monitor id for query
#'
#' @return monitor query id. character.
#' @noRd
#' @keywords internal
create_monitor_code <- function(aqs_code, col_names = FALSE){
  monitor_number <- c(1, 2, 3, 6, 7, 8, 11, 12, 13,
                      14, 18, 23, 24, 25, 28, 42)
  monitor_col_name <- c("pm10", "ws", "wd", "tc", "tc8", "tc20", "rh",
                        "p", "sr", "pp", "o3", "no", "no2", "nox", "pm25",
                        "co")
  monitor_id <- paste(paste0("%22S_", aqs_code, "_", monitor_number, "%22"),
                      collapse = ",")
  monitor_id_query <- paste0("[", monitor_id, "]")
  if (col_names){
    names_df <- data.frame(
      id_names = paste0("S_", aqs_code, "_", monitor_number),
      pol_names = monitor_col_name)
    return(names_df)
  }
  return(monitor_id_query)
}
