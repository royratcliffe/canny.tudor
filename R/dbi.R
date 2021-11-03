#' Define schema
#' @param x Name of schema.
#' @export
schema <- function(x) structure(x, class = "schema")

#' Glue SQL schema
#' @param x Schema to use for gluing.
#' @param ... Extra arguments passed to method implementation.
#' @export
glue_sql <- function(x, ...) UseMethod("glue_sql", x)

#' Glue schema to SQL statement
#' @param x Schema to use for gluing.
#' @inheritDotParams glue::glue_sql
#' @export
glue_sql.schema <- function(x, ...) glue::glue_sql(..., schema = x)

#' Create scheme unless exists
#' @param x Schema to create.
#' @param ... Extra arguments passed to method implementation.
#' @export
create_if_not_exists <- function(x, ...) UseMethod("create_if_not_exists", x)

#' Create scheme if it does not yet exist
#' @param x Schema to create, if not existing.
#' @param .con Database connect to use for literal quoting and for executing the
#'   schema-glued statement. Create schema has no default connection. Uses the
#'   same connection for quoting SQL and running it.
#' @inheritDotParams DBI::dbExecute
#' @export
create_if_not_exists.schema <- function(x, .con = NULL, ...)
  DBI::dbExecute(.con,
                 glue_sql(x, "CREATE SCHEMA IF NOT EXISTS {`schema`}",
                          .con = .con), ...)

#' Drop database entity
#' @param x Entity to drop.
#' @param ... Extra arguments passed to method implementation.
#' @export
db_drop <- function(x, ...) UseMethod("db_drop", x)

#' Drop schema
#' @param x Schema to drop.
#' @export
db_drop.schema <- function(x,
                           if_exists = FALSE,
                           cascade = FALSE, .con = NULL, ...) {
  DBI::dbExecute(.con,
                 glue_sql(x,
                          paste(c("DROP", "SCHEMA",
                                  if (if_exists) c("IF", "EXISTS"),
                                  "{`schema`}",
                                  if (cascade) "CASCADE"),
                                collapse = " "), .con = .con), ...)
}
