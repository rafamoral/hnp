\name{fungi}
\alias{fungi}
\docType{data}
\encoding{UTF-8}
\title{
\emph{Diaphorina citri} mortality data
}
\description{
Mortality of the Citrus psyllid, \emph{Diaphorina citri}, a major pest of Citrus worldwide, when exposed to different concentrations of two fungi species, \emph{Beauveria bassiana} and \emph{Isaria fumosorosea}.
}
\usage{data(fungi)}
\format{
  A data frame with 30 observations on the following 5 variables.
\tabular{lll}{
\code{y}\tab numeric\tab number of dead insects\cr
\code{m}\tab numeric\tab total number of insects\cr
\code{conc}\tab numeric\tab fungi concentration (in conidia/ml)\cr
\code{lconc}\tab numeric\tab natural logarithm of fungi concentration\cr
\code{species}\tab  factor\tab  levels \code{isaria} and \code{beauveria}, fungi species
  }
}
\details{
The Citrus psyllid \emph{Diaphorina citri} is a vector of Huanglongbing, known as greening disease. An
alternative to chemical control is to use solutions of fungi
conidia as a biological control strategy. D'Alessandro (2014)
conducted a completely randomized experiment to assess how
different conidia concentrations ($10^4$, $10^5$, $10^6$, $10^7$
and $10^8$ conidia/ml) of two fungi species, \emph{Beauveria
bassiana} and \emph{Isaria fumosorosea}, infected \emph{D. citri}
adults. Each experimental unit consisted of around 20 \emph{D.
citri} adults, which were placed on \emph{Citrus limonia} plants.
The insects were pulverized with the solutions and after 10 days
the number of dead insects and dead insects due to fungus
infection were observed. Note that in this case the conidia
concentrations are obtained in successive dilutions and therefore
small variations in the number of conidia per ml may contribute
additional variability to the data. Such additional variability
may be accounted for in the model by including an additive random
effect in the linear predictor.
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
D'Alessandro (2014) Unpublished data, private communication.
}
\examples{
data(fungi)

# Binomial fit
model1 <- glm(cbind(y, m-y) ~ lconc*species,
              family=binomial, data=fungi)
anova(model1, test="Chisq")
sum(resid(model1, ty="pearson")^2)
1 - pchisq(sum(resid(model1, ty="pearson")^2), 20)
hnp(model1)

# Quasi-binomial fit
model2 <- glm(cbind(y, m-y) ~ lconc*species,
              family=quasibinomial, data=fungi)
anova(model2, test="F")
hnp(model2)

\dontrun{
# Logistic-normal fit
require(lme4)
fungi$ind <- factor(1:nrow(fungi))
model3 <- glmer(cbind(y, m-y) ~ lconc*species + (1|ind),
                family=binomial, data=fungi)
summary(model3)
hnp(model3)
}

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
