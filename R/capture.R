#' Regular expression captures
#'
#' Always specify `perl = TRUE` in the extra arguments.
#' @export
regexpr.captures <- function(pattern, x, ...) {
  result <- regexpr(pattern, x, ...)
  attr(result, "captures") <- substr.capture.matrix(x, capture.matrix(result))
  result
}

#' Apply capture matrix
#'
#' Applies capture matrix to an input string.
#'
#' @param x input string, a character vector
#' @export
substr.capture.matrix <- function(x, m) {
  apply(m, 1, function(row) {
    start <- row["start"]
    substr(x, start, start + row["length"] - 1)
  })
}

#' Regular expression capture matrix
#'
#' Creates a matrix of start indices and length counts. Maintains any capture
#' names as row names; column names become "start" and "length" corresponding to
#' capture start and capture length.
#'
#' @param x Result of \code{\link[base]{regexpr}} with capture attributes.
#' @export
capture.matrix <- function(x) {
  sapply(c("start", "length"), function(.)
    attr(x, paste("capture", ., sep = "."))[1, ])
}
