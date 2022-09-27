#' Half-duplex socket communication
#' @description Writes then reads a socket connection.
#' @param x Socket connection.
#' @param text Lines of text to write to the socket connection, a character
#'   vector. Writes all the lines before reading.
#' @param write.sep Line separator written after every line of \code{text}, a
#'   character string defaulting to a single new-line character \code{"\n"}.
#' @param write.useBytes Suppresses re-encoding of marked strings.
#' @param timeout Seconds to wait for ready socket, a numeric; or wait
#'   indefinitely, \code{NULL}.
#' @inheritDotParams base::scan
#' @export
#' @examples
#' \dontrun{
#' hdx(con, c("hello", "world"), what = character())
#' }
hdx.sockconn <- function(x, text,
                         write.sep = "\n", write.useBytes = FALSE,
                         timeout = NULL, ...) {
  writeLines(text, x, sep = write.sep, useBytes = write.useBytes)
  if (socketSelect(list(x), FALSE, timeout)) scan(x, ...)
}

#' Vectorised half-duplex socket communication
#' @export
vhdx.sockconn <- Vectorize(hdx.sockconn, "text")

#' @export
hdx <- function(x, ...) UseMethod("hdx", x)

#' @export
vhdx <- function(x, ...) UseMethod("vhdx", x)