test_that("docker config works", {
  stopifnot(file.exists(.docker_config.json))

  config <- .docker_config()
  expect_equal(config$currentContext, "default")
})
