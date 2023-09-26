dlm <- function(formula, data, weights=NULL, sandwich=FALSE) {
	init <- dbiglm(formula, as.list(data)[[1]], weights, sandwich)
	if (length(as.list(data)) != 1L)
		largescaler::dReduce(f=update,
				     x=as.list(data)[-1],
				     init=init)
	else largescaler::DistributedObject(init)
}

dbiglm <- function(formula, data, weights=NULL, sandwich=FALSE) {
	chunknet::do.ccall(biglm,
		           list(list(formula=formula,
				     data=data,
				     weights=weights,
				     sandwich=sandwich)),
			    target=data)[[1]]
}
