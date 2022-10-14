test_that("unflattened named list fails", {
  expect_error(unflatten_named.list(list("a", 1, "b")))
})

test_that("unflattened named list works", {
  expect_equal(unflatten_named.list(list("COUNT", 1L)), list(COUNT = 1L))
})

test_that("flattened named list works", {
  expect_equal(flatten_named.list(list(COUNT = 1L)), list("COUNT", 1L))
})
