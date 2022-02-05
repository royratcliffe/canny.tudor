testthat::skip_on_os(c("mac", "linux", "solaris"))

test_that("Windows system variables work", {
  system <- Windows.system_variables()
  expect_type(system, "list")
  expect_type(system$Path, "character")
})

test_that("Windows user variables work", {
  user <- Windows.system_variables()
  expect_type(user, "list")
  expect_type(user$Path, "character")
})
