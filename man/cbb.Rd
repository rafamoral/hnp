\name{cbb}
\alias{cbb}
\docType{data}
\encoding{UTF-8}
\title{Coffee berry borer trapping data}
\description{Data on counts of coffee berry borer obtained using different traps through time.}
\usage{data(cbb)}
\format{
  A data frame with 288 observations on the following 4 variables.
 \tabular{lll}{
\code{week}\tab numeric\tab week of observation (1 to 24)\cr
\code{block}\tab factor\tab  levels \code{I} \code{II} \code{III} \code{IV}\cr
\code{trap}\tab factor \tab levels \code{CV} \code{F} \code{SF}\cr
\code{count}\tab numeric\tab number of observed insects	
 }
}
\details{
The coffee berry borer is a major pest of commercial coffee. The insect directly attacks the coffee fruit in development causing severe losses in bean production and quality.
This data set was obtained in an experiment conducted by Mota (2013), where three types of traps (\code{SF}, \code{F}, \code{CV}) were randomized in each of four equidistant lines (blocks) of a coffee field. Each week, over a 24 week period, the insects were removed from the traps and counted.
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
Mota, L. H. C. (2013) Desenvolvimento de armadilha de auto-inoculacao para o controlde de Hypothenemus hampei (Ferrari, 1867) (Coleoptera: Curculionidae) com Beauveria bassiana (Bals.) Vuil (Ascomycota: Hypocreales) em tecido sinetico. Master's dissertation, ESALQ-USP
}
\examples{
data(cbb)
# exploratory plot
require(latticeExtra)
trellis.par.set(strip.background=list(col="lightgrey"))
useOuterStrips(xyplot(count ~ week | block + trap, data=cbb,
  layout=c(3,1),type="l", col=1, xlab="Week", ylab="Insect counts"))

# Poisson fit
model1 <- glm(count ~ block + trap*factor(week),
              data=cbb, family=poisson)
anova(model1, test="Chisq")
sum(resid(model1, ty="pearson")^2)
summary(model1)
hnp(model1, sim=19, conf=1)

\dontrun{
hnp(model1) # default call
}

# Quasi-Poisson fit
model2 <- glm(count ~ block + trap*factor(week), data=cbb,
              family=quasipoisson)
anova(model2, test="F")
summary(model2)
hnp(model2, sim=19, conf=1)

\dontrun{
hnp(model2) # default call
}

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
