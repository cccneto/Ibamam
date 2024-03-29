% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01-get_data.R
\name{get_data_of_state}
\alias{get_data_of_state}
\title{Obter dados de arrecadacao para um estado}
\usage{
get_data_of_state(uf, tipo_multa)
}
\arguments{
\item{uf}{Abreviation of the name of the state (two letters in lower case)}

\item{tipo_multa}{Which dataset to search for. Can receive one of the values:
'arrecadadas' or 'distribuidas'}
}
\value{
A tibble
}
\description{
Obter dados de arrecadacao para um estado
}
\keyword{internal}
