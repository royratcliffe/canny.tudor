#' Upload data frame as feather
#'
#' Utilises \link{httr}, \link{feather} and \link{withr} packages.
#'
#' @param x Data frame to upload
#' @param ... Extra arguments for \code{httr::\link[httr]{POST}}
#' @export
upload_feather <- function(x, ...)
  withr::with_tempfile("path", {
    feather::write_feather(x, path)
    httr::POST(body = httr::upload_file(path, type = "application/feather"), ...)
  })
