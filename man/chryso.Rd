\name{chryso}
\alias{chryso}
\docType{data}
\encoding{UTF-8}
\title{\emph{Chrysoperla externa} mortality data}
\description{Mortality of the predator \emph{Chrysoperla externa} on different doses of lime sulphur, a substance used to control pests on trees.}
\usage{data(chryso)}
\format{
  A data frame with 24 observations on the following 4 variables.
\tabular{lll}{
\code{dead}\tab numeric \tab count of dead C. externa specimens\cr
\code{alive}\tab numeric\tab count of alive C. externa specimens\cr
\code{conc}\tab numeric\tab lime sulphur concentration\cr
\code{log.conc}\tab numeric \tab natural logarithm of lime sulphur concentration
  }
}
\details{
The neuropteran \emph{Chrysoperla externa} is a predator that acts
as a natural enemy of the brown citrus aphid, \emph{Toxoptera
citricida}, which is among the most important citrus pests
worldwide. A possible strategy to control \emph{T. citricida}
populations would be to use a substance called lime sulphur and the \emph{C. externa} predator
in combination, which may be beneficial as long as the lime sulphur has less
effect on the predator than the prey. To explore this, Battel (2012) conducted an
experiment with first-instar larvae of \emph{Chrysoperla
externa} exposed to different levels of lime sulphur.
Specifically, twenty-four Orange Jessamine (\emph{Murraya
paniculata}) plants were sprayed with different concentrations (\code{conc}) of
lime sulphur and up to seven first-instar larvae were placed on each
plant. The experiment was set up in a completely randomized design with four treatments:
lime sulphur concentrations at 0ppm (water control), 60ppm,  600ppm,
and 6000ppm. The plants were observed until the predators reached the second instar and
the number of larvae that died on each plant was recorded.
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
Battel, A. P. M. B. (2012) Dinamica de predacao e resposta funcional em \emph{Chrysoperla externa} (\emph{Neuroptera: Chrysopidae}) sobre \emph{Toxoptera citricida} (\emph{Hemiptera: Aphididae}) aplicada a citricultura organica. Master's dissertation, ESALQ-USP
}
\examples{
data(chryso)

# fit model using conc levels both on log-scale and
# as a factor to produce simple analysis of deviance
model <- glm(cbind(dead, alive) ~  log.conc + factor(conc),
             family=binomial, data=chryso)
anova(model, test="Chisq")
# test adequacy of factor model using deviance and X2
1-pchisq(deviance(model), df.residual(model))
(X2 <- sum(residuals(model, type="pearson")^2))
1-pchisq(X2, df.residual(model))

model1 <- glm(cbind(dead, alive) ~ log.conc,
              family=binomial, data=chryso)
par(mfrow=c(1,2), cex=1.4)
with(chryso, plot(jitter(log.conc), dead/(dead+alive),
                  ylab="Proportion dead", xlab="log(conc+1)"))
x <- seq(0, 8.7, .1)
pr <- predict(model1, data.frame(log.conc=x), ty="response")
lines(x, pr)
# half-normal plot
hnp(model1, xlab="Half-normal scores",
    ylab="Deviance residuals", pch=4)

require(MASS)
dose.p(model1, p=.10)

logLC10 <- dose.p(model1, p=.10)
LC10 <- exp(logLC10[[1]]) - 1

#95% CI on log-dose scale using transformation
c(logLC10[1]-2*attr(logLC10,'SE'),
  logLC10[1]+2*attr(logLC10,'SE'))

#95% CI on dose scale using transformation
c(exp(logLC10[1]-2*attr(logLC10,'SE'))-1,
  exp(logLC10[1]+2*attr(logLC10,'SE'))-1)

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
