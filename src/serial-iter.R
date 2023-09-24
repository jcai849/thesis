addsone <- function(start, to) {
	nextEl <- function(){
		start <<- start + 1
		if (start >= to) {
			stop('StopIteration')
		}
		start}
	obj <- list(nextElem=nextEl)
	class(obj) <- c('addsone', 'abstractiter', 'iter')
	obj
}

it <- addsone(10, 15)
nextElem(it)

foreach(i = addsone(10, 15), .combine = c) %do% i
