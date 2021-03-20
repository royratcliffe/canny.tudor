#' Formats SQL using the sqlformat.org API.
#'
#' @description See example usage below. Arguments
#' are named list elements corresponding to format parameters. Only `sql` is
#' required; the rest have sensible defaults.
#'
#' See https://sqlformat.org/api/ for details. A usage limit exists: 500 requests
#' per hour based on the IP address.
#'
#' @param sql Structured Query Language.
#' @param ... Format parameters.
#' @examples
#' sql.format(sql="select * from foo", reindent=1, keyword_case="upper")
#' # -> [1] "SELECT *\nFROM foo"
sql.format <- function(sql, ...) {
  response <- httr::POST("https://sqlformat.org/api/v1/format",
    body = list(sql = sql, ...))
  httr::stop_for_status(response)
  httr::warn_for_status(response)
  httr::content(response, type = "application/json")$result
}
