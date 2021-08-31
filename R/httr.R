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

#' Parse and re-parse while only scheme and path
#'
#' Parses the given URL and continuously parses the resulting path so long as
#' the result is only a scheme and path. This occurs for nested schemes. The
#' final URL accumulates the scheme as a character vector with super- to
#' sub-scheme ordering.
#'
#' The implementation repeatedly parses, that is re-parses, while non-null URL
#' components result in only a scheme-path pair. Note that URLs carry NULL
#' values for non-existent URL components.
#'
#' @param x URL to parse for components.
#' @return URL components with vectorised nested scheme.
#' @export
#' @examples
#' url <- reparse_url("superscheme:subscheme://host/path")
#' url$scheme
#' # [1] "superscheme" "subscheme"
reparse_url <- function(x) {
  url <- httr::parse_url(x)
  while (identical(names(Filter(Negate(is.null), url)), c("scheme", "path")) &&
         !is.null((path_url <- httr::parse_url(url$path))$scheme)) {
    scheme <- url$scheme
    url <- path_url
    url$scheme <- c(scheme, url$scheme)
  }
  url
}
