\name{progeny}
\alias{progeny}
\encoding{UTF-8}

\docType{data}
\title{
\emph{Sitophilus zeamais} progeny
}
\description{
Progeny of \emph{Sitophilus zeamais}, the maize weevil, when treated with different organic extracts
}
\usage{data(progeny)}
\format{
  A data frame with 40 observations on the following 2 variables.
\tabular{lll}{
\code{extract}\tab factor\tab  levels \code{leaf}, \code{branch}, \code{seed} and \code{control}\cr
\code{y}\tab numeric \tab number of emerged insects after 60 days
}}
\details{
Petri dishes containing 10g of corn were treated with
extracts prepared with different parts of the plant \emph{Annona mucosa}
(seeds, leaves and branches) at a concentration of 1500 mg/kg
or just water (control), using a completely randomized design with 10 replicates.
Then 20 \emph{S. zeamais} adults were placed in each Petri dish and
the focus is on the numbers of emerged insects (progeny) after 60 days, see Ribeiro et al (2013).
}
\source{
\enc{Demétrio}{Demetrio}, C. G. B., Hinde, J. and Moral, R. A. (2014) Models for overdispersed data in entomology. In Godoy, W. A. C. and Ferreira, C. P. (Eds.) Ecological modelling applied to entomology. Springer.
}
\references{
Ribeiro, L. P., Vendramin, J. D., Bicalho, K. U., Andrade, M. S., Fernandes, J. B., Moral, R. A., \enc{Demétrio}{Demetrio}, C. G. B. (2013) Annona mucosa Jacq. (Annonaceae): A promising source of bioactive compounds against Sitophilus zeamais Mots. (Coleoptera: Curculionidae). J Stored Prod Res 55:6-14
}
\examples{
data(progeny)

# Poisson fit
model1 <- glm(y ~ extract, family=poisson, data=progeny)
anova(model1, test="Chisq")                
                 
# Quasi-Poisson fit    
model2 <- glm(y ~ extract, family=quasipoisson, data=progeny)
summary(model2)$dispersion
anova(model2, test="F")

# half-normal plots
par(mfrow=c(1,2),cex=1.4, cex.main=0.9, pty='s')
hnp(model1, pch=4, main="(a) Poisson; log-linear",
    xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2, pch=4, main="(b) Quasi-Poisson; log-linear",
    xlab="Half-normal scores", ylab="Deviance residuals")
    
anova(model1, test="Chisq") # Poisson model
anova(model2, test="F") # quasi-Poisson model
summary(model1) # Poisson model
summary(model2) # quasi-Poisson model

# now with factor level parameterisation
summary(update(model1,.~.-1))
summary(update(model2,.~.-1))

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)
}
\keyword{datasets}
