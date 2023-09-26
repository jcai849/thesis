Math.DistributedObject <- function(x, ...)
        do.dcall(.Generic, c(list(x=x), list(...)))

map_reduce <- function(map, reduce) {
        function(..., addl_map_args, addl_reduce_args) {
                mapped <- emerge(do.dcall(map, c(list(...), addl_map_args)))
                do.call(reduce, c(list(mapped), addl_reduce_args)) # reduced
        }
}

Summary.DistributedObject <- function(..., na.rm = FALSE)  
        map_reduce(.Generic, .Generic)(...,
				       addl_map_args=list(na.rm=na.rm),
				       addl_reduce_args=list(na.rm=na.rm)) 
