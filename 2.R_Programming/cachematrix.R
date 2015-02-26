## This function creates a type of matrix that 
## stores the value of its inversion in cache
makeCacheMatrix <- function(x = matrix()) {
	invMatrix<-NA
	set<-function(y){
		x<-y
		invMatrix<-NULL
	}
	get<-function() x
	setreverse<-function(reverse) invMatrix <<- reverse
	getreverse<-function() invMatrix
	list(set = set, get = get,
		setreverse = setreverse,
		getreverse = getreverse)
}


cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
	invMatrix<-x$getreverse()
	if(!is.na(invMatrix)){
		message("Getting cached data.")
		return(invMatrix)
	}
	## Get Matrix data
	data<-x$get()
	## Ensure that 'x' is a square matrix
	if(ncol(data)==nrow(data))
	{
		invMatrix<-solve(data,...)
		## Store the value of the computation
		x$setreverse(invMatrix)
		invMatrix
	}
	else
	{
		message("This is not a square matrix.")
	}
}