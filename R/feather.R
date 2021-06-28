#' Read data frame from raw
#'
#' Reads a feathered data frame via a temporary file. Note that the
#' \link{feather} package handles files \emph{only}. First writes \code{object}
#' to temporary file before reading it back as a data frame.
#'
#' @param object Raw content to read as feather file
#' @return Data frame as \code{tibble::\link[tibble]{tibble}}
#' @export
#' @examples
#' \donttest{
#' # Suppose that you have a HTTP response with a binary response body encoding
#' # a feathered data frame.
#' readFeather(httr::content(res))
#'
#' # More specifically, say you have a Plumber handler as follows. It handles
#' # a POST request with a feather body and responds with a feather body.
#'
#'   #* Echo feathered data frame
#'   #* @parser feather
#'   #* @serializer feather
#'   #* @post /echo-df
#'   function(req) req$body
#'
#' # Upload a feather and read-back the echo using this call. It answers a three
#' # by one tibble.
#' readFeather(httr::content(upload_feather(data.frame(a = c(1, 2, 3)),
#'   "http://localhost:7939/echo-df")))
#' }
readFeather <- function(object)
  withr::with_tempfile("path", {
    writeBin(object, path)
    feather::read_feather(path)
  })
