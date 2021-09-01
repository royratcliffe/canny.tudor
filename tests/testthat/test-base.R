test_that("strsplit.trimws works", {
  expect_equal(strsplit.trimws("a, b, c", ","), c("a", "b", "c"))
})
