test_that("GitLab works", {
  library(gitlabr)
  set_gitlab_connection(gitlab_url = "https://gitlab.com", private_token = "")

  expect_snapshot(list.gitlab.project.files("30946364"))
})
