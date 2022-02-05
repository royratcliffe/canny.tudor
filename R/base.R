#' Split string and trim white space
#'
#' Trims both leading and trailing white space.
#'
#' @param x What to split, a character vector.
#' @param split What to use for splitting. Either a character vector or an
#'   object that can coerce to such.
#' @inheritDotParams base::strsplit
#' @return Split strings, a character vector.
#' @export
strsplit.trimws <- function(x, split, ...)
  unlist(lapply(strsplit(x, split, ...), trimws))

#' Types of vector
#' @param x Vector or list
#' @return Named types, vector of character
#' @export
types.of <- function(x) sapply(names(x), function(y) typeof(x[[y]]))
