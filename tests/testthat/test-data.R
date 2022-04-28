test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("sampled dataset has 1000 rows", {
  expect_equal(nrow(trip_history_sample), 1000)
})

test_that("sampled dataset has 14 variables as documented", {
  expect_equal(ncol(trip_history_sample), 14)
})

test_that("sampled dataset is a dataframe", {
  expect_type(trip_history_sample, "list")
})

test_that("station data is a dataframe", {
  expect_type(station_data, "list")
})

test_that("added distance column is a double vector", {
  test_distance <- trip_distance(trip_history_sample)
  expect_type(test_distance$distance, "double")
})

test_that("imported trip history dataset is a dataframe", {
  import_data <- import_month_data(2020, 2)
  expect_type(import_data, "list")
})

test_that("station distance output dataset is a dataframe", {
  station_df <- station_distance(-71.11467361, 42.34414899)
  expect_type(station_df, "list")
})

test_that("station radius function outputs a leaflet map", {
  radius_map <- station_radius(long = -71.11467, lat = 42.34415, r = 2000)
  expect_equal(class(radius_map), c("leaflet", "htmlwidget"))
})
