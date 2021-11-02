test_that("GitLab works", {
  expect_type(set.gitlab.connection(), "closure")
  expect_snapshot(list.gitlab.project.files("30946364"))
})
