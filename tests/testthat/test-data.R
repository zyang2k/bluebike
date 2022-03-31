test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("sampled dataset has 1000 rows", {
  expect_equal(nrow(trip_history_sample), 1000)
})

test_that("sampled dataset has 14 variables as documented", {
  expect_equal(ncol(trip_history_sample), 14)
})

