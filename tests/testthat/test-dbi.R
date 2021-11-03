test_that("DBI schema works", {
  expect_snapshot(schema("my"))

  expect_snapshot(schema("my") %>%
                    glue_sql("hello {schema}", .con = DBI::ANSI()))

  expect_snapshot(schema("my") %>%
                    glue_sql("CREATE SCHEMA {`schema`}", .con = DBI::ANSI()))
})
