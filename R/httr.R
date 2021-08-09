#' Upload data frame as feather
#'
#' Sends a HTTP POST request with content type of \code{application/feather}
#' where the POST body is a feathered rendering of the given data frame,
#' \code{x}. Writes the data frame to a temporary file before uploading it. This
#' allows for large data sets where in-memory representation consumes excessive
#' amounts of RAM, especially at scale. Costs temporary file-system space for
#' the duration of transfer. Utilises \link{httr}, \link{feather} and
#' \link{withr} packages.
#'
#' @param x Data frame to upload
#' @param ... Extra arguments for \code{httr::\link[httr]{POST}}
#' @export
upload_feather <- function(x, ...)
  withr::with_tempfile("path", {
    feather::write_feather(x, path)
    httr::POST(body = httr::upload_file(path, type = "application/feather"), ...)
  })
