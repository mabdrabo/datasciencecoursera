## Script to caches the repeated matrix inversion operation performed on
## same matrix. It stores the value returned by solve operation as a part
## of the matrix itself and gives the cached result if the inverse operation
## was performed before.


## Creates a cache object initialized with the passed matrix.

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Solves, stores, and returns the inverse of the cached matrix,
## or only returns it if it already exists.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
