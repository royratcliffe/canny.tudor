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
#' Automatically groups by table. Adds a new logical column \code{pk} for
#' whether or not the table-column tuple operates as part of a primary key,
#' either alone or part of a composite primary key.
#'
#' @param x Data model, \code{dm} instance.
#' @inheritDotParams purrr::imap
#' @export
collect_column_classes_by_table <- function(x, ...) {
  UseMethod("collect_column_classes_by_table")
}

#' @export
collect_column_classes_by_table.dm <- function(x, ...) {
  all_pks <- dm_get_all_pks(dm)
  dm::dm_get_tables(x) %>%
    purrr::imap(~ collect_name_and_class(.x, table = .y), ...) %>%
    dplyr::bind_rows() %>%
    dplyr::rename(column = name) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(pk = nrow(all_pks[
      all_pks$table == table & column == all_pks$pk_col,
    ]) != 0L) %>%
    dplyr::group_by(table)
}

#' Get All Primary Keys from Data Model
#'
#' Gets all keys but also unlists the \code{pk_col} column.
#'
#' @inheritDotParams dm::dm_get_all_pks
#' @return Data frame of two variables: \code{table} of character and
#'   \code{pk_col} for the primary-key column, also of character.
#' @export
dm_get_all_pks <- function(...) {
  stopifnot(requireNamespace("dm", quietly = TRUE))
  all_pks <- dm::dm_get_all_pks(...)
  all_pks$pk_col <- unlist(all_pks$pk_col)
  all_pks
}

#' Get All Primary Key Columns
#'
#' @inheritDotParams dm_get_all_pks
#' @return Data frame of \code{table} and \code{pk_cols}; the latter collecting
#'   a list-wrapped vector of sorted primary-key columns.
#' @export
dm_get_all_pk_cols <- function(...) {
  dm_get_all_pks(...) %>%
    dplyr::group_by(table) %>%
    dplyr::summarise(pk_cols = list(sort(dplyr::cur_data()$pk_col)))
}
