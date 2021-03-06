% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fct_analytics.R
\name{analytics}
\alias{analytics}
\title{Get analytics on udpiped object}
\usage{
analytics(piped)
}
\arguments{
\item{piped}{a dataframe produced by udpipe::udpipe AKA "piped text"}
}
\value{
a dataframe containing assorted analytics
}
\description{
Metrics are divided into features (feat) and subfeatures (sub_feat).
POS features give a sheer percentage as their rate. 
Other features give a count/100 words rate.
These metrics are purely descriptive and provide a reference to check against 
other relevant materials.
With time, the intention is to build out a proper database of reference materials.
}
