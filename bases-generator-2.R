#'
#' @title 
#' @description 
#' @param n.obs the sample size
#' @param n.var study variables
#' @param digits number of decimal places
#' @param type data distribuition type
#' if type=normal, for normal distribution
#' if type=unif, for uniform distribution
#' if type=binom, for binomial distribution
#' if type=beta, for beta distribution
#' if type=exp, for exponential distribution
#' @param mean vector of means, for normal distribution
#' @param sd vector of standard deviations, for normal distribution
#' @param min lower limits of the uniform distribution
#' @param max upper limitis of uniform distribution
#' @param rate vector of rates, for exponential distribution
#' 
dataGen <- function(n.obs, n.var, filename, digits=3, type="normal", mean=NULL, sd=NULL, min=0, max=1, rate=1){
  hs.grad <- sample(c("yes", "no"), n.obs, replace = TRUE)
  race <- sample(c("black", "white", "asian"), n.obs, replace = TRUE, prob = c(.25,.5,.25))
  gender <- sample(c("male", "female"), n.obs, replace = TRUE)
  n.kids <- rpois(n.obs, 1.5)
  ncols <- n.var-4
  M <- list()
  if (type=='normal') {
    M <- as.data.frame(replicate(ncols, round(rnorm(n=n.obs, mean=mean, sd=sd), digits=digits)))
  }
  if (type=='unif') {
    M <- as.data.frame(replicate(ncols, runif(n.obs, min, max)))
  }
  if (type=='binom') {
    k <- seq(0, n.obs, by=20)
    M <- as.data.frame(replicate(ncols, dbinom(k, n.obs, 0.5, log=TRUE)))
  }
  if (type=='beta') {
    M <- as.data.frame(replicate(ncols, rbeta(n.obs, 1, 1)))
  }
  if (type=='exp') {
    M <- as.data.frame(replicate(ncols, rexp(n.obs, rate)))
  }
  set <- cbind(hs.grad, race, gender, n.kids, M)
  #Write the database as csv
  write.csv(set, filename)
  return(set)
}

################# T E S T ##################
setwd("/home/paula/testes-pacote")
conf.test <- list(n.obs=30000, n.var=10)
dataGen(conf.test$n.obs, conf.test$n.var, filename = "/home/paula/testes-pacote/datasets/bigsets/unif-general2.csv", type = "unif")