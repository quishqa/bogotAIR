test_that('download_rmcab_data works!', {
  usaquen_code <- 1
  start_date <- '01-01-2009'
  end_date <- '07-01-2009'

  usaquen <- download_rmcab_data(aqs_code = usaquen_code,
                                 start_date = start_date,
                                 end_date = end_date)

  expect_equal(nrow(usaquen), 168)
  expect_equal(class(usaquen), 'data.frame')
  expect_equal(TRUE, 'POSIXct' %in% class(usaquen$date))
  for (col in names(usaquen)[-1]){
    expect_equal(class(usaquen[[col]]), 'numeric')
  }
})
