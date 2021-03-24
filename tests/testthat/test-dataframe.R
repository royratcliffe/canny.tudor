test_that("p.q.frame works", {
  expect_equal(p.q.frame(1:2), data.frame(p = c(1, 2), q = c(2, 1)))
})
