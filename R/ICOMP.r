`ICOMP` <-
function(model.list) {

  if(class(model.list) == 'list') {
  val.mat	<- matrix(NA, 3, length(model.list))
  name.vec	<- vector('numeric', length(model.list))
  for(i in 1:length(model.list)) {

    ICOMP.val	<- ICOMP.lm(model.list[[i]])
    ICOMPr.val	<- ICOMPr.lm(model.list[[i]])
    ICOMPcv.val	<- ICOMPcv.lm(model.list[[i]])
    value	<- c(ICOMP.val, ICOMPr.val, ICOMPcv.val)
    val.mat[,i]	<- value
    name.vec[i]	<- paste('model',i, sep='')


  }#end if
    names.list		<- list()
    names.list[[1]]	<- NULL
    names.list[[2]]	<- name.vec
    dimnames(val.mat)	<- names.list
    return(data.frame(val.mat, row.names=c("ICOMP", "ICOMPr", "ICOMPcv")))
  }#, for

  if(class(model.list) == 'lm') {

    ICOMP.val	<- ICOMP.lm(model.list)
    ICOMPr.val	<- ICOMPr.lm(model.list)
    ICOMPcv.val	<- ICOMPcv.lm(model.list)
    value	<- c(ICOMP.val, ICOMPr.val, ICOMPcv.val)
    return(data.frame(value, row.names=c("ICOMP", "ICOMPr", "ICOMPcv")))

  }
  else { cat('error, not a valid object', '\n') }

}

