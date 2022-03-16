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

#' Collect All Column Name and Class by Table
#'
#' Automatically groups by table.
#'
#' @param x Data model, \code{dm} instance.
#' @inheritDotParams purrr::imap
#' @export
collect_column_classes_by_table <- function(x, ...) {
  UseMethod("collect_column_classes_by_table")
}

#' @export
collect_column_classes_by_table.dm <- function(x, ...) {
  dm::dm_get_tables(x) %>%
    purrr::imap(~ collect_name_and_class(.x, table = .y), ...) %>%
    dplyr::bind_rows() %>%
    dplyr::group_by(table)
}
