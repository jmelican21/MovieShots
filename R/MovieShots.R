#' Movie Shots (1915-2015)
#'
#' This package includes information about shot duration
#' in movies made between 1915 and 2015.
#' @docType package
#' @name MovieShots
#' @aliases MovieShots MovieShots-package
NULL

#' "MovieShots"
#'
#' MovieShots is data set containing duration of
#' each shot from 192 movies.
#'
#' @source \url{http://people.psych.cornell.edu/~jec7/data.htm}
#' @format A dataframe with 208604 elements
#' \describe{
#'   \item{duration}{Shot length (in seconds)}
#'   \item{frame}{Frame number at beginning of shot}
#'   \item{title}{Title of movie (from filename)}
#'   \item{year}{Year of release}
#' }
"MovieShots"
