test_that("docker config works", {
  skip_if_not(file.exists(.docker_config.json))

  config <- .docker_config()
  expect_type(config, "list")
})
