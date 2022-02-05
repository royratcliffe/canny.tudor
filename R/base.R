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

#' All sub-class methods
#' @param x Object with class
#' @return Methods by sub-class, list of character vectors
#' @export
#' @examples
#' all_subclass_methods(0L)
all_subclass_methods <- function(x)
  sapply(class(x), function(x)
    utils::methods(class = x), simplify = FALSE)
