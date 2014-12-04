\name{corn}
\alias{corn}
\docType{data}
\encoding{UTF-8}
\title{Corn damage data}
\description{
Corn grain damage by the maize weevil, a major pest of stored maize worldwide.
}
\usage{data(corn)}
\format{
  A data frame with 40 observations on the following 3 variables.
\tabular{lll}{
\code{extract}\tab factor\tab with levels \code{leaf}, \code{branch}, \code{seed} and \code{control}\cr
\code{m}\tab numeric\tab total number of corn grains\cr
\code{y}\tab numeric\tab number of damaged corn grains
  }
}
\details{
A major pest of stored  maize in Brazil is \emph{Sitophilus zeamais}.
In an experiment to assess the insecticide action of organic
extracts of \emph{Annona mucosa} (\emph{Annonaceae}), Petri dishes containing 10g of corn were treated with
extracts prepared with different parts of the plant
(seeds, leaves and branches) at a concentration of 1500mg/kg
or just water (control), using a completely randomized design with 10 replicates.
Then 20 Sitophilus zeamais adults were placed in each Petri dish
and, after 60 days, the numbers of damaged and undamaged corn grains were counted, see Ribeiro et al (2013).
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
Ribeiro, L. P., Vendramin, J. D., Bicalho, K. U., Andrade, M. S., Fernandes, J. B., Moral, R. A., \enc{Demétrio}{Demetrio}, C. G. B. (2013) \emph{Annona mucosa Jacq.} (\emph{Annonaceae}): A promising source of bioactive compounds against \emph{Sitophilus zeamais Mots.} (\emph{Coleoptera: Curculionidae}). J Stored Prod Res 55:6-14
}
\examples{
data(corn)

# Binomial fit
model1 <- glm(cbind(y, m-y) ~ extract, family=binomial,
              data=corn)
anova(model1, test="Chisq")
hnp(model1, pch=4, main="Binomial: Logit",
    xlab="Half-normal scores", ylab="Deviance residuals")

# Quasi-binomial fit
model2 <- glm(cbind(y, m-y) ~ extract, family=quasibinomial,
              data=corn)
anova(model2, test="F")
summary(model2)$dispersion # estimated phi

# half-normal plots
par(mfrow=c(1,2),cex=1.4, cex.main=0.9, pty='s')
hnp(model1, pch=4, main="(a) Binomial; Logit",
    xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2, pch=4, main="(b) Quasibinomial; Logit",
    xlab="Half-normal scores", ylab="Deviance residuals")

anova(model1, test="Chisq") # binomial model
anova(model2, test="F") # quasi-binomial model
summary(model1) # binomial model
summary(model2) # quasi-binomial model

# now with factor level parameterisation
summary(update(model1,.~.-1))
summary(update(model2,.~.-1))

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
