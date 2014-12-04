\name{oil}
\alias{oil}
\docType{data}
\encoding{UTF-8}

\title{
\emph{Diaphorina citri} oviposition data
}
\description{
Effects of three agricultural oils on \emph{Diaphorina citri} oviposition.
}
\usage{data(oil)}
\format{
  A data frame with 70 observations on the following 2 variables.
\tabular{lll}{
\code{y}\tab numeric \tab number of eggs laid\cr
\code{treat}\tab  factor \tab levels \code{Control}, \code{Oppa0.5}, \code{Oppa1.0}, \code{Iharol0.5}, \code{Iharol1.0}, \code{Nortox0.5} and \code{Nortox1.0}
  }}

\details{
In an experiment to assess the effect of three agricultural oils
on the oviposition of \emph{Diaphorina citri}, seventy Orange
Jessamine (\emph{Murraya paniculata}) plants were sprayed with
solutions of the mineral oils Oppa and Iharol, and the vegetable
oil Nortox. The experiment used the oils in concentrations of
0.5 and 1.0 percent and a control of plain water set out in a
completely randomized design with ten replicates. Following
treatment, when the plants were dry, ten pregnant females of
\emph{D. citri} were released on each plant. After five days, the
insects were removed and the total number of eggs on each plant
was observed, see Amaral et al (2012). This is an example of aggregated data as
the number of eggs is the sum over the (unrecorded)
numbers of eggs deposited each day and the possibility of day to
day variation may contribute additional variability to the
recorded counts.
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
Amaral, F. S. A., Poltronieri, A. S., Alves, E. B., Omoto, C. (2012) Efeito de oleos agricolas no comportamento de oviposicao e viabilidade de ovos de \emph{Diaphorina citri Kuwayama} (\emph{Hemiptera: Psyllidae}). In: XX Simposio Internacional de Iniciacao Cientifica da Universidade de Sao Paulo, 2012, Pirassununga
}
\examples{
data(oil)

# Poisson fit
model1 <- glm(y ~ treat, family=poisson, data=oil)
anova(model1, test="Chisq")
sum(resid(model1, ty="pearson")^2)

# Quasi-Poisson fit
model2 <- glm(y ~ treat, family=quasipoisson, data=oil)
summary(model2)
anova(model2,test="F")
summary(model2)$dispersion

# Negative binomial fit
require(MASS)
model3 <- glm.nb(y ~ treat, data=oil)
thetahat <- summary(model3)$theta
anova(model3, test="F")

# half-normal plots
par(mfrow=c(1,3),cex=1.4, cex.main=0.9)
hnp(model1,pch=4, main="(a) Poisson",
     xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2,pch=4, main="(b) Quasi-Poisson",
     xlab="Half-normal scores", ylab='')
hnp(model3,pch=4, main="(c) Negative binomial",
     xlab="Half-normal scores", ylab='')

\dontrun{
# using aods3
require(aods3)
model3b <- aodml(y ~ treat, family="nb", phi.scale="inverse",
                 fixpar=list(8, 1.086148), data=oil)
hnp(model3b)
}

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
