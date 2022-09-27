#' Half-duplex socket communication
#' @description Writes then reads a socket connection.
#' @details The second half of the half-duplex communication, the scan half,
#'   terminates on remote buffer flush, not necessarily on a line termination.
#'   Typically the server side socket \emph{will} automatically flush when it
#'   sees a line terminator. It could however flush for other reasons, in which
#'   case the scan will complete.
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
#' @description Vectorises on text.
#' @details Scans after every character string.
#' @inheritDotParams hdx.sockconn
#' @export
#' @examples
#' \dontrun{
#' vhdx(con, letters[1:3], write.sep = "", what = character())
#' }
vhdx.sockconn <- Vectorize(hdx.sockconn, "text")

#' Half-duplex communication
#' @export
hdx <- function(x, ...) UseMethod("hdx", x)

#' Vectorised half-duplex communication
#' @export
vhdx <- function(x, ...) UseMethod("vhdx", x)
