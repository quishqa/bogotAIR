#' Create the monitor id for query
#'
#' @return monitor query id. character.
#' @noRd
#' @keywords internal
create_monitor_code <- function(aqs_code, col_names = FALSE){
  monitors <- as.data.frame(
    rmcab_monitor_code$monitors[rmcab_monitor_code$stationId == aqs_code])
  monitor_id <- paste(
    paste0("%22S_", aqs_code, "_", monitors$channelId, "%22"),
    collapse = ",")
  monitor_id_query <- paste0("[", monitor_id, "]")
  if (col_names){
    names_df <- data.frame(
      id_names = paste0("S_", aqs_code, "_", monitors$channelId),
      pol_names = gsub(" ", "_", tolower(monitors$name)))
    return(names_df)
  }
  return(monitor_id_query)
}
