% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gitlab.R
\name{get.gitlab.project.id}
\alias{get.gitlab.project.id}
\title{Gets project identifier as integer}
\usage{
get.gitlab.project.id(...)
}
\arguments{
\item{...}{
  Arguments passed on to \code{\link[dplyr:filter]{dplyr::filter}}
  \describe{
    \item{\code{.data}}{A data frame, data frame extension (e.g. a tibble), or a
lazy data frame (e.g. from dbplyr or dtplyr). See \emph{Methods}, below, for
more details.}
    \item{\code{.preserve}}{Relevant when the \code{.data} input is grouped.
If \code{.preserve = FALSE} (the default), the grouping structure
is recalculated based on the resulting data, otherwise the grouping is kept as is.}
  }}
}
\description{
You can use the extra arguments to filter the incoming project tibble by path
or other criteria.
}
\examples{
\dontrun{
list.gitlab.maintainer.projects() \%>\%
  get.gitlab.project.id(path == "path-of-gitlab-project")
}
}
