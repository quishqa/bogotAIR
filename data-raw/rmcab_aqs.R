## code to prepare `rmcab_aqs` dataset goes here
rmcab <- jsonlite::fromJSON("~/Documents/rmcab_aqs.txt")
rmcab_aqs <- rmcab[, c(1, 2, 6)]
names(rmcab_aqs)[c(1, 2)] <- c("name", "code_aqs")

usethis::use_data(rmcab_aqs, overwrite = TRUE)
