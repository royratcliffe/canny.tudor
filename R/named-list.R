#' Flatten a named list
#' @description Named list to interlaced names and values, each name followed
#'   immediately by its associated value.
#' @param x Named list.
#' @return Unnamed list of names and values, interlaced.
#' @export
flatten_named.list <- function(x) {
  i <- 2L * seq_along(x)
  unnamed <- list()
  unnamed[i] <- x
  unnamed[i - 1L] <- names(x)
  unnamed
}

#' Collect interlaced names and values
#' @description Named list from interlaced names and values. The first named
#'   item comes from the first and second incoming items, the name and its value
#'   respectively; subsequent named items collect from any following interlaced
#'   name-value pairs.
#' @param x List of names and values, interlaced.
#' @return Named list.
#' @export
unflatten_named.list <- function(x) {
  i <- 2L * seq_along(x)
  dim(i) <- c(length(x) / 2L, 2L)
  i <- i[, 1L]
  named <- x[i]
  names(named) <- x[i - 1L]
  named
}
