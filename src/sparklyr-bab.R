library(sparklyr)

sc <- spark_connect(master = "yarn")

sparklyr_sqrt <- function(S, sc, frac_tolerance=0.01, initial=1){
        bab = sdf_copy_to(sc,
                          data.frame(x=initial, S=S, unfinished=TRUE),
                          "bab", memory = TRUE, overwrite = TRUE)
	while(any(collect(bab)$unfinished)){
                compute(mutate(bab, x = (x + S/x)/2,
                               unfinished = abs(x^2 - S)/S > frac_tolerance),
                        "bab")
        }
        collect(bab)$x
}
