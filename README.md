# bogotAIR

This package downloads the meteorological and air quality data from [Bogota Air Quality Network](http://rmcab.ambientebogota.gov.co/Report/HourlyReports). It returns a `data.frame` ready to be used for analyzis.

## Installation

To install `bogotAIR` you need first to install `devtools`.
You can do it by:

```R
install.package("devtools")
```

Then install `bogotAIR` by:
```R
devtools::install_github("quishqa/bogotAIR")
```

## How to use

Currently `bogotAIR`has one function: **`download_rmcab_data()`**.
To use this function you need to know the code of the station. You can check it by:
```R
library(bogotAIR)
rmcab_aqs
```
For example, If we want to download data for the first week of 2023 for Usaquen station. We do the following:
```R
library(bogotAIR)
rmcab_aqs # To check Usaquen code

usaquen_code <- 1
start_date <- "01-01-2023"
end_date <- "07-01-2023

usaquen_data <- download_rmcab_data(usaquen_code, 
                                    start_date,
                                    end_date)
```

# Acknowledgment
Thanks to [RCMA](https://www.ambientebogota.gov.co/estaciones-rmcab) for sharing their air quality data.