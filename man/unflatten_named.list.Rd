% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/named-list.R
\name{unflatten_named.list}
\alias{unflatten_named.list}
\title{Collect interlaced names and values}
\usage{
unflatten_named.list(x)
}
\arguments{
\item{x}{List of names and values, interlaced.}
}
\value{
Named list.
}
\description{
Named list from interlaced names and values. The first named
item comes from the first and second incoming items, the name and its value
respectively; subsequent named items collect from any following interlaced
name-value pairs.
}
