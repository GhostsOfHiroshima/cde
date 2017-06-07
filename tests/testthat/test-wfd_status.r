library(cde)
context("wfd_status")

test_that("wfd_status returns a dataframe", {
  # retrieve data for specific waterbody
  testframe<-wfd_status("GB520804714300", "WBID")
  # check that it outputs a dataframe object
  expect_true(is.data.frame(testframe))
  
})

test_that("dimensions of dataframe are as expected", {
  # retrieve data for Avon Warwickshire MC
  test_mc_avon<-wfd_status("Avon Warwickshire", "MC")
  # check that the dimensions are 516 rows, 17 cols
  expect_true(all(dim(test_mc_avon)== c(516, 17)))

})

test_that("invalid column specified returns an error", {
  # retrieve data for column "Aardvark"
  expect_error(wfd_status("Avon Warwickshire", "Aardvark"))
})

test_that("invalid string returns an error", {
  # retrieve data for site "Aardvark"
  expect_error(wfd_status("Aardvark", "WBID"))
})

test_that("invalid type returns an error", {
  # retrieve data for site "Aardvark"
  expect_error(wfd_status("Avon Hampshire", "MC", startyr=2012, type="Aardvark"))
})


test_that("start date outside data range returns an error", {
  # retrieve data for site "Aardvark"
  expect_error(wfd_status("Avon Hampshire", "MC", startyr=1900))
})

test_that("end date before start date returns an error", {
  # retrieve data for site "Aardvark"
  expect_error(wfd_status("Avon Hampshire", "MC", startyr=2012, endyr=1900))
})

test_that("end date outside available range returns an error", {
  # retrieve data for site "Aardvark"
  expect_error(wfd_status("Avon Hampshire", "MC", startyr=2012, endyr=2018))
})
