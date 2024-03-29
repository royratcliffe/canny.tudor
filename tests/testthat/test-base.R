test_that("strsplit.trimws works", {
  expect_equal(strsplit.trimws("a, b, c", ","), c("a", "b", "c"))
})

test_that("types.of works", {
  expect_snapshot(types.of(list(int = 123L, dbl = 123.456, chr = "hello")))
})
