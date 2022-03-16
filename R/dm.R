#' Collects Classes of Table Columns
#' @param x \code{dm} class object, a data model.
#' @param ... Ignored parameters.
#' @return Named list of named character vectors. The list names match the names
#'   of the data model tables. The vector names match the names of the table
#'   columns; the character elements describe the class of the column.
#' @export
collect_table_column_classes <- function(x, ...) {
  UseMethod("collect_table_column_classes")
}

#' @export
collect_table_column_classes.dm <- function(x, ...) {
  lapply(x, function(y) sapply(dplyr::collect(y, n = 0L), class))
}
