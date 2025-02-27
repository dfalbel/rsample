% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validation_split.R
\name{validation_split}
\alias{validation_split}
\title{Create a Validation Set}
\usage{
validation_split(data, prop = 3/4, strata = NULL, breaks = 4, pool = 0.1, ...)
}
\arguments{
\item{data}{A data frame.}

\item{prop}{The proportion of data to be retained for modeling/analysis.}

\item{strata}{A variable in \code{data} (single character or name) used to conduct
stratified sampling. When not \code{NULL}, each resample is created within the
stratification variable. Numeric \code{strata} are binned into quartiles.}

\item{breaks}{A single number giving the number of bins desired to stratify a
numeric stratification variable.}

\item{pool}{A proportion of data used to determine if a particular group is
too small and should be pooled into another group. We do not recommend
decreasing this argument below its default of 0.1 because of the dangers
of stratifying groups that are too small.}

\item{...}{Not currently used.}
}
\value{
An tibble with classes \code{validation_split}, \code{rset}, \code{tbl_df}, \code{tbl},
and \code{data.frame}. The results include a column for the data split objects
and a column called \code{id} that has a character string with the resample
identifier.
}
\description{
\code{validation_split()} takes a single random sample (without replacement) of
the original data set to be used for analysis. All other data points are
added to the assessment set (to be used as the validation set).
}
\details{
With a \code{strata} argument, the random sampling is conducted
\emph{within the stratification variable}. This can help ensure that the
resamples have equivalent proportions as the original data set. For
a categorical variable, sampling is conducted separately within each class.
For a numeric stratification variable, \code{strata} is binned into quartiles,
which are then used to stratify. Strata below 10\% of the total are
pooled together; see \code{\link[=make_strata]{make_strata()}} for more details.
}
\examples{
validation_split(mtcars, prop = .9)
}
