test_that("GitLab works", {
  expect_type(set.gitlab.connection(), "closure")
  project <- "30946364"
  files <- list.gitlab.project.files(project)
  expect_snapshot(files)
  expect_snapshot(names(files))
  blobs <- files[tools::file_ext(files$name) == "R", ] %>%
    head() %>%
    get.gitlab.blobs(project)
  expect_snapshot(names(blobs))
})
