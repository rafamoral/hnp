\name{wolbachia}
\alias{wolbachia}
\encoding{UTF-8}

\docType{data}
\title{
\emph{Trichogramma galloi} parasitism data
}
\description{
Viability of \emph{Trichogramma galloi}, a parasitoid wasp, when infected with \emph{Wolbachia}, a bacteria known to change its reproductive aspects.
}
\usage{data(wolbachia)}
\format{
  A data frame with 106 observations on the following 3 variables.
\tabular{lll}{
\code{y}\tab numeric; number of eggs with an orifice\cr
\code{m}\tab numeric; total number of parasitised eggs\cr
\code{treat}\tab a factor with levels \code{m+f+}, \code{m+f-}, \code{f+}, \code{m-f-} and \code{f-},\cr
\tab where \code{m} stands for male, \code{f} stands for female, \code{+} means infected and \code{-} means non-infected;\cr
\tab \code{f+} and \code{f-} represent virgin infected and non-infected females, respectively.
  }
}
\details{
The bacteria \emph{Wolbachia} is commonly found in various insect
species and has the ability to change reproductive aspects of its
host. When it infects the wasp \emph{Trichogramma galloi} it is known to induce
thelythokous parthenogenesis, i.e., only females are produced from
unfertilized eggs. Souza (2011) conducted
an experiment to assess the effects of \emph{Wolbachia} on the
viability of \emph{T. galloi} eggs. Around 100 \emph{Diatraea saccharalis}
eggs (the host) were offered to infected (+) or non-infected (-)
parasitoid couples or virgin females every day until the death of
the female. The parasitised eggs, easily identifiable
because they become dark, were then kept on moist filter paper for
twenty days when counts were then made of the number of
eggs that had an orifice, which meant that an adult parasitoid had
emerged and thus the parasitoid was viable.
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
Souza, A. R. (2011) A interacao \emph{Wolbachia} - \emph{Trichogramma galloi Zucchi}, 1988 (\emph{Hymenoptera: Trichogrammatidae}). Master's dissertation, ESALQ-USP
}
\examples{
data(wolbachia)

# Binomial fit
model1 <- glm(cbind(y, m-y) ~ treat, family=binomial, data=wolbachia)
anova(model1, test="Chisq")

# Quasi-binomial fit
model2 <- glm(cbind(y, m-y) ~ treat, family=quasibinomial, data=wolbachia)
summary(model2)
anova(model2,test="F")

## half normal plots
par(mfrow=c(1,2),cex=1.2, cex.main=1.1)
hnp(model1, print=TRUE, pch=4, main="(a) Binomial",
    xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2, print=TRUE, pch=4, main="(b) Quasi-binomial",
    xlab="Half-normal scores", ylab='')

\dontrun{
# Beta-binomial fit                                                
### using package aods3
require(aods3)                                                     
                                                                   
model3 <- aodml(cbind(y, m-y) ~ treat, family='bb', data=wolbachia)
hnp(model3, print=TRUE, pch=4,                                     
    xlab="Half-normal scores", ylab='Deviance residuals')          

### using package VGAM
require(VGAM)

model3a <- vglm(cbind(y, m-y) ~ treat, family=betabinomial,
                data=wolbachia)
summary(model3a)
1/(1+exp(-coef(model3a)[2])) # phi estimate
hnp(model3a, data=wolbachia)
}

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
