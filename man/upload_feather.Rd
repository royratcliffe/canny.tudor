% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/httr.R
\name{upload_feather}
\alias{upload_feather}
\title{Upload data frame as feather}
\usage{
upload_feather(x, ...)
}
\arguments{
\item{x}{Data frame to upload}

\item{...}{Extra arguments for \code{httr::\link[httr]{POST}}}
}
\description{
Sends a HTTP POST request with content type of \code{application/feather}
where the POST body is a feathered rendering of the given data frame,
\code{x}. Writes the data frame to a temporary file before uploading it. This
allows for large data sets where in-memory representation consumes excessive
amounts of RAM, especially at scale. Costs temporary file-system space for
the duration of transfer. Utilises \link{httr}, \link{feather} and
\link{withr} packages.
}
