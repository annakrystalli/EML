% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set_coverage.R
\name{set_taxonomicCoverage}
\alias{set_taxonomicCoverage}
\title{set_taxonomicCoverage}
\usage{
set_taxonomicCoverage(sci_names, expand = FALSE, db = "itis")
}
\arguments{
\item{sci_names}{string (space separated) or list or data frame of scientific names for species covered.}

\item{expand}{Set to TRUE to use taxize to expand sci_names into full taxonomic classifications}

\item{db}{The taxonomic database to query (when expand is set to \code{TRUE}). See \code{\link[taxize]{classification}} for valid options. Defaults to 'itis'.}
}
\value{
a taxonomicCoverage object for EML
}
\description{
set_taxonomicCoverage
}
\details{
Turn a data.frame or a list of scientific names into a taxonomicCoverage block
sci_names can be a space-separated character string or a data frame with column names as rank name
or a list of user-defined taxonomicClassification
}
\note{
If "sci_names" is a data frame, column names of the data frame are rank names.
For user-defined "sci_names", users must make sure that the order of rank names
they specify is from high to low.
Ex. "Kingdom","Phylum","Class","Order","Family","Genus","Species","Common"
EML permits any rank names provided they go in descending order.
}
\examples{

sci_names <- data.frame(
  Kingdom = "Plantae",
  Phylum = "Phaeophyta",
  Class = "Phaeophyceae",
  Order = "Laminariales",
  Family = "Lessoniaceae",
  Genus = "Macrocystis",
  Species = "pyrifera"
)
taxon_coverage <- set_taxonomicCoverage(sci_names)

\donttest{ # Examples that may take > 5s

# Query ITIS using taxize to fill in the full taxonomy given just species
#  # names
taxon_coverage <- set_taxonomicCoverage(
  c("Macrocystis pyrifera", "Homo sapiens"),
  expand = TRUE
)

# Query GBIF instead of ITIS
taxon_coverage <- set_taxonomicCoverage(
  c("Macrocystis pyrifera"),
  expand = TRUE,
  db = "gbif"
)

## use a list of lists for multiple species
sci_names <- list(list(
  Kindom = "Plantae",
  Phylum = "Phaeophyta",
  Class = "Phaeophyceae",
  Order = "Laminariales",
  Family = "Lessoniaceae",
  Genus = "Macrocystis",
  Species = "pyrifera"
))
set_taxonomicCoverage(sci_names)

}
}
