\name{plot.hnp}
\alias{plot.hnp}
\encoding{UTF-8}
\title{Plot Method for hnp Objects}
\description{The \code{plot} method for objects of class hnp.}
\usage{\method{plot}{hnp}(x, cex, pch, col, lty, lwd, type,
                          xlab, ylab, main, legpos, legcex, ...)}
\arguments{
  \item{x }{object of class \code{"hnp"}.}
  \item{cex }{character expansion size.}
  \item{pch }{character string or vector of one character or integer for plotting characters, see \code{\link{points}}.}
  \item{col }{vector of colors.}
  \item{lty }{vector of line types.}
  \item{lwd }{vector of line widths.}
  \item{type }{type of plot for each envelope band and points. Default is \code{c("l","l","l","p")}.}
  \item{xlab }{title for x axis, as in \code{\link{plot}}}
  \item{ylab }{title for y axis, as in \code{\link{plot}}}
  \item{main }{plot title.}
  \item{legpos }{if \code{print.on=TRUE}, represents the position where the information should be printed (\code{"topright"}, \code{"topleft"}, \code{"bottomright"}, \code{"bottomleft"}), as in \code{\link{legend}}.}
  \item{legcex }{if \code{print.on=TRUE}, character expansion size of \code{\link{legend}}.}
  \item{\dots }{extra graphical arguments passed to \code{\link{matplot}}.}
}
% \details{}
\value{None.}
\references{
\enc{Demétrio}{Demetrio}, C. G. B. and Hinde, J. (1997) Half-normal plots and overdispersion. GLIM Newsletter 27:19-26.

Hinde, J. and \enc{Demétrio}{Demetrio}, C. G. B. (1998) Overdispersion: models and estimation. Computational Statistics and Data Analysis 27:151-170.

\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\author{
Rafael A. Moral <rafael_moral@yahoo.com.br>, John Hinde and Clarice G. B. \enc{Demétrio}{Demetrio}
}
% \note{}
\seealso{
\code{\link{hnp}}
}
\examples{
## Simple Poisson regression
set.seed(100)
counts <- c(rpois(5, 2), rpois(5, 4), rpois(5, 6), rpois(5, 8))
treatment <- gl(4, 5)
fit <- glm(counts ~ treatment, family=poisson)
anova(fit, test="Chisq")

## half-normal plot
hnp(fit)

## or save it in an object and then use the plot method
my.hnp <- hnp(fit, print.on=TRUE, plot=FALSE)
plot(my.hnp)

## changing graphical parameters
plot(my.hnp, lty=2, pch=4, cex=1.2)
plot(my.hnp, lty=c(2,3,2), pch=4, cex=1.2, col=c(2,2,2,1))
plot(my.hnp, main="Half-normal plot", xlab="Half-normal scores",
     ylab="Deviance residuals", legpos="bottomright")
}
\keyword{ plot }
\keyword{ hnp }
