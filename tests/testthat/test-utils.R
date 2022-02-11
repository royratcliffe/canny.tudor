test_that("unzip_bin works", {
  zipfile <- tempfile(fileext = ".zip")
  on.exit(unlink(zipfile))
  txtfile <- tempfile(fileext = ".txt")
  on.exit(unlink(txtfile))
  hello <- "你好"
  expect_equal(Encoding(hello), "UTF-8")
  writeLines(hello, txtfile, useBytes = TRUE)
  zip::zip(zipfile, files = txtfile, mode = "cherry-pick")
  ziplist <- zip::zip_list(zipfile)
  filename <- ziplist[, "filename"]
  expect_equal(length(filename), 1)

  rawzip <- xfun::read_bin(zipfile)
  bins <- unzip_bin(rawzip)
  expect_equal(length(bins), 1)

  bin <- bins[[filename]]
  char <- rawToChar(bin)
  expect_equal(Encoding(char), "unknown")
  Encoding(char) <- "UTF-8"
  expect_equal(Encoding(char), "UTF-8")
  con <- textConnection(char, encoding = "UTF-8")
  lines <- readLines(con, encoding = "UTF-8")
  expect_equal(lines[1], hello)
})
