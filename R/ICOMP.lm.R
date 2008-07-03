`ICOMP.lm` <-
function(lm.model) {

  lLik		<- logLik(lm.model)
  X.mat		<- model.matrix(lm.model)
  inv.matrix	<- solve(t(X.mat)%*%X.mat)
  cov.matrix	<- summary(lm.model)$sigma^2*inv.matrix
  k		<- dim(inv.matrix)[1]+1
  icomp.val	<- -2*lLik + 2*(k/2*log(sum(diag(cov.matrix)/k)) - 1/2*log(det(cov.matrix)))

  return(icomp.val[1])

}

