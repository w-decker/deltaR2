#' Calculate delta R squared for two different linear models
#' 
#' @param fullm The full model
#' @param restrim The restricted model
#' @param data Standardized data frame of data
#' @return Returns a numeric vector
#' @example deltaR2(fullm = y ~ x1 + x2, restrim = y ~ x2, data = data)

deltaR2 <- function (fullm, restrim, data) {
  
  # get some values 
  N <- nrow(data)
  K <- length(labels(terms(fullm)))
  diff <- K - (length(labels(terms(restrim))))
  
  # get R2
  fullm_R2 <- summary(lm(fullm, data=data))$r.squared
  restrim_R2 <- summary(lm(restrim, data=data))$r.squared
  
  # compute f test
  DR2 <- (fullm_R2 - restrim_R2)
  ms <- (diff * (1 - fullm_R2))/(N - K - 1)
  f <- DR2 / ms
  
  return(c("D" = diff, "N-K-1" = (N-K-1), "Delta R2" = DR2, "F Value" = f))
}