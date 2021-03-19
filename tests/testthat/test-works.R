test_that("select star from foo", {
  expect_equal("SELECT *\nFROM foo",
               sql.format("select * from foo",
                          reindent = 1,
                          keyword_case = "upper",
                          strip_comments = 1))
})
