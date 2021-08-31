test_that("reparse_url works", {
  expect_snapshot(reparse_url("superscheme:subscheme://host/path"))
})
