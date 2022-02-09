test_that("copy.env works", {
  a <- new.env()
  b <- new.env()
  a$x <- 1L
  a$y <- "abc"
  b$x <- "x"
  copy.env(a, b)
  expect_equal(b$x, 1L)
  expect_equal(b$y, "abc")
  expect_equal(length(a), 2L)
  expect_equal(length(b), 2L)
})
