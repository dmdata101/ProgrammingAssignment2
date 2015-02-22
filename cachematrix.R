## Put comments here that give an overall description of what your
## functions do

## Functions below cache computationally intensive calculations such as inverting a matrix

## Code by dmdata101

## Write a short comment describing this function

## Creates a 'matrix' which is in fact functions to allow caching the result if already computed.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function (y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinvert <- function(invert) i <<- invert
    getinvert <- function() i
    list ( set = set, get = get,
           setinvert = setinvert,
           getinvert = getinvert)
}


## Write a short comment describing this function

## Solves the inversion, unless the result already exists in cache - in that case returns cached result

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinvert()
  if(!is.null(i)) {
    message("Result exists already! Getting cached data.")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinvert(i)
  i
  
}
