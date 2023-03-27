## code to prepare `rmcab_aqs` dataset goes here
rmcab <- jsonlite::fromJSON("~/Documents/rmcab_aqs.txt")
rmcab_aqs <- rmcab[, c(1, 2)]
names(rmcab_aqs)[c(1, 2)] <- c("aqs", "code")
rmcab_aqs$lat <- rmcab$location$latitude
rmcab_aqs$lon<- rmcab$location$longitude

rmcab_params <- as.data.frame(rmcab[rmcab$stationId == 32, ]$monitors)
rmcab_params <- rmcab_params[c("name", "units")]

usethis::use_data(rmcab_aqs, rmcab_params, overwrite = TRUE)
