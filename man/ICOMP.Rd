\name{ICOMP}
\alias{ICOMP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ICOMP}
\description{
Function for calculating the ICOMP criterion for one lm object or several objects in a list. Returns ICOMP, ICOMPr and ICOMPcv values.
}
\usage{
ICOMP(model.list)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model.list}{A list of models or else a single lm model }
}
\details{
  A smaller ICOMP value corresponds to a better model.

  Values are not comparable across criterion.
}
\value{
If a model object is provided, ICOMP returns 3 values with labels given below. If a list is provided, ICOMP returns a data frame with
each models ICOMP values listed. Order of model outputs is the same as the list input.
  \item{ICOMP }{numeric value of ICOMP}
  \item{ICOMPr }{numeric value of ICOMPr}
  \item{ICOMPcv }{numeric value of ICOMPcv}

}

\references{ Bozdogan, H. Haughton, D.M.A (1998). Information complexity criteria for regression models. Computation Statistics & Data Analysis 28: 51-76 }
\author{ Jake Ferguson }

%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
%\examples{}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ regression }
% $\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
