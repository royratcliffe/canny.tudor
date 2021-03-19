# Formats SQL using the sqlformat.org API. See example usage below. Arguments
# are named list elements corresponding to format parameters. Only "sql" is
# required; the rest have sensible defaults.
#
#   > sql.formatter(sql="select * from foo", reindent=1, keyword_case="upper")
#   [1] "SELECT *\nFROM foo"
#
# See https://sqlformat.org/api/ for details. A usage limit exists: 500 requests
# per hour based on the IP address.
sql.format <- function(sql, ...) {
  response <- httr::POST("https://sqlformat.org/api/v1/format",
    body = list(sql = sql, ...))
  httr::stop_for_status(response)
  httr::warn_for_status(response)
  httr::content(response, type = "application/json")$result
}
