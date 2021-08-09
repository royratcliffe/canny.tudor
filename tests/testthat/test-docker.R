stopifnot(file.exists(.docker_config.json))

test_that("docker config works", {
  config <- .docker_config()
  expect_equal(config$currentContext, "default")
})
