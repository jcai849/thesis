distChunk <- function(x, ...) {
	if (missing(x)) {
		dc <- new.env()
		class(dc) <- "distChunk"
		return(dc)
	}
	UseMethod("distChunk", x)
}
chunkID <- function(x, ...) {
	if (missing(x)) {
		cID <- paste0("C", rediscc::redis.inc(conn(), "CHUNK_ID"))
		class(cID) <- "chunkID"
		return(cID)
	}
	UseMethod("chunkID", x)
}
`chunkID<-` <- function(x, value) { assign("CHUNK_ID", value, x); x }
jobID <- function(x, ...) {
	if (missing(x)) {
		jID <- paste0("J", rediscc::redis.inc(conn(), "JOB_ID"))
		class(jID) <- "jobID"
		return(jID)
	}
	UseMethod("jobID", x)
}
`jobID<-` <- function(x, value) { assign("JOB_ID", value, x); x }
chunk <- function(x, ...) UseMethod("chunk", x)
dist <- function(x, ...) UseMethod("dist", x)
dist.default <- stats::dist
distChunk.jobID <- function(x, ...) {
	dc <- distChunk()
	jobID(dc) <- x
	dc
}
distChunk.chunkID <- function(x, ...) {
	dc <- distChunk()
	chunkID(dc) <- x
	dc
}
init <- local({
	rsc <- NULL
	distInit <- function(queueHost="localhost", queuePort=6379L, ...) {
		# Place for starting up worker nodes
		rsc <<- rediscc::redis.connect(queueHost, queuePort)
	}
	conn <- function() {
		if (is.null(rsc)) 
			stop("Redis connection not found. Use `distInit` to initialise.")
		rsc
	}
})
distInit <- get("distInit", environment(init))
conn <- get("conn", environment(init))
