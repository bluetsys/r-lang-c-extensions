dyn.load("foo.so")

foo <- function(x) {
		if (!is.numeric(x))
				stop("argument x must be numeric")
		out <- .C("foo",
				len=as.integer(length(x)),
				x=as.double(x))

		return(out$x)
}

vector <- 1:10

foo(vector)

dyn.unload("foo.so")