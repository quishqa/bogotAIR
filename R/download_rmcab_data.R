download_rmcab_data <- function(aqs_code, start_date, end_date){
  url <- "http://rmcab.ambientebogota.gov.co/Report/GetMultiStationsReportNewAsync"

  query <-  list(
    ListStationId=I(paste0("[", aqs_code, "]")),
    ListMonitorIds=I("[%22S_1_1%22,%22S_1_3%22,%22S_1_4%22,%22S_1_5%22,%22S_1_6%22,%22S_1_7%22,%22S_1_8%22,%22S_1_9%22,%22S_1_10%22,%22S_1_11%22,%22S_1_13%22,%22S_1_16%22]"),
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