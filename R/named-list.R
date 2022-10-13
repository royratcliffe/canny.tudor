#' @export
flatten_named.list <- function(x) {
  i <- 2L * seq_along(x)
  unnamed <- list()
  unnamed[i] <- x
  unnamed[i - 1L] <- names(x)
  unnamed
}

#' @export
unflatten_named.list <- function(x) {
  i <- 2L * seq_along(x)
  dim(i) <- c(length(x) / 2L, 2L)
  i <- i[, 1L]
  named <- x[i]
  names(named) <- x[i - 1L]
  named
}
