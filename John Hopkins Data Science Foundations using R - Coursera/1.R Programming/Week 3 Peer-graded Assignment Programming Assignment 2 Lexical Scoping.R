


makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setinverse(inv)
  inv
}


m <- matrix(c(1, 2, 3, 4), 2, 2)
cm <- makeCacheMatrix(m)
cacheSolve(cm)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5


cacheSolve(cm)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
