## code to prepare `rmcab_monitor_code` dataset goes here
rmcab_monitor_code <- jsonlite::fromJSON("~/Documents/rmcab_aqs.txt")
usethis::use_data(rmcab_monitor_code, overwrite = TRUE, internal = TRUE)
