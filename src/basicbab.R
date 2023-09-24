basic_sqrt <- function(S, frac_tolerance=0.01, initial=1){
	x <- initial
	while(abs(x\^2 - S)/S > frac_tolerance){
		x <- (x + S/x)/2
	}
	x
}
