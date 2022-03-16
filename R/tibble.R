#' Collect Name and Class
#'
#' Performs a zero-row collection on the incoming frame in order to obtain an
#' empty \code{\link[tibble]{tibble}}.
#'
#' @param x Data frame to collect.
#' @inheritDotParams tibble::tibble
#' @return Data frame with \code{name} and \code{class} columns, each column of
#'   character type.
#' @export
collect_name_and_class <- function(x, ...) {
  classes <- dplyr::collect(x, n = 0L)
  tibble::tibble(name = names(classes), class = sapply(classes, class), ...)
}
