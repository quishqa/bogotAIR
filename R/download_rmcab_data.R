#' Dowload air quality and meterological data from air quality station of RMCAB
#'
#' This function download the data from one station of Bogota air quality
#' network. Missing data is in NA.
#'
#' @param aqs_code Integer with the code of the station. See rmcab_aqs().
#' @param start_date Date to start downloading in dd-mm-yyyy.
#' @param end_date Date to start downloading in dd-mm-yyyy.
#'
#' @return data frame with station data.
#' @export
#'
#' @examples
#' \dontrun{
#' # Download data from Usaquen from first week of February
#' usaquen_code <- 1 # rmcab_aqs
#' usaquen <- download_rmcab_data(usquen_code, "01-02-2023", "07-02-2023")
#' }
download_rmcab_data <- function(aqs_code, start_date, end_date){
  start_date <- paste(start_date, "00:00")
  end_date <- paste(end_date, "23:00")

  url <- paste0("http://rmcab.ambientebogota.gov.co/Report/",
                "GetMultiStationsReportNewAsync")
  monitors_ids = paste0("[%22S_1_1%22,%22S_1_3%22,%22S_1_4%22,%22S_1_5%22,",
                        "%22S_1_6%22,%22S_1_7%22,%22S_1_8%22,%22S_1_9%22,",
                        "%22S_1_10%22,%22S_1_11%22,%22S_1_13%22,%22S_1_16%22]")

  query <-  list(
    ListStationId=I(paste0("[", aqs_code, "]")),
    ListMonitorIds=I(monitors_ids),
    FDate=I(date_in_json(start_date)),
    TDate=I(date_in_json(end_date)),
    TB=I("[60]"),
    ToTB=60,
    ReportType="Average",
    first="true",
    take=0,
    skip=0,
    page=1,
    pageSize=0
  )

  data_raw <- httr::GET(
    url,
    query = query
  )

  data_parsed <- httr::content(data_raw, as="parsed")
  data_aqs <- data_parsed$Data
  n_obs <- data_parsed$count

  data_list <- data_aqs[seq(1, n_obs)]
  data_df <- convert_list_to_df(data_list)
  return(data_df)
}
