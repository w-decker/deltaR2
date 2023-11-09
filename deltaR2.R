#' Calculate delta R squared for two linear models
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
  df <- N - K - 1
  diff <- K - (length(labels(terms(restrim))))
  
  # get R2
  fullm_R2 <- summary(lm(fullm, data=data))$r.squared
  restrim_R2 <- summary(lm(restrim, data=data))$r.squared
  
  # compute f test
  DR2 <- (fullm_R2 - restrim_R2)
  ms <- (diff * (1 - fullm_R2))/df
  f <- DR2 / ms
  
  return(c("D" = diff, "df's" = df, "Delta R2" = DR2, "F Value" = f))
}