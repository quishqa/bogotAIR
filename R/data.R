#' RMCAB AQS station latitude and longitude
#'
#' RMCAB air quality stations (AQS) latitudes and longitudes.
#' Use this to check the AQS \code{aqs_code} argument in
#' \code{download_rmcab_data()}.
#' #'
#' @format A data frame with 20 observations and 4 variables:
#' \describe{
#' \item{aqs}{RMCAB AQS name.}
#' \item{code}{RMCAB AQS code.}
#' \item{lat}{RMCAB AQS latitude.}
#' \item{lon}{RMCAB AQS longitude.}
#' }
#' @examples
#' rmcab_aqs
"rmcab_aqs"

#' RMCAB AQS parameters
#'
#' RMCAB air quality stations parameters
#' Use this to check the units of columsn in returned data.frame
#' #'
#' @format A data frame with 13 observations and 2 variables:
#' \describe{
#' \item{name}{RMCAB parameter name.}
#' \item{units}{Parameter unit.}
#' }
#' @examples
#' rmcab_params
"rmcab_params"
