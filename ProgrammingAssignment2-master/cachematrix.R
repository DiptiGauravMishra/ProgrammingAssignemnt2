# In this, we will mainly use two functions which is are : MakeCacheMatrix , CacheSolve. 
# The second functions calculates the inverse of the "matrix" returned by makeCacheMatrix. 
# The following functions are also used for a list conatining a function for:
# 'setting'  the value of the matrix
# 'getting' the value of the matrix

# The function creates a special “matrix” object which will cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    p <- NULL
  set <- function(y) {
          x <<- y
          p <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) p <<- inverse
  getinverse <- function() p
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}




# The below function calculates  inverse of the special “matrix” returned by makeCacheMatrix which is mentioned before this.

cacheSolve <- function(x, ...) {
        
p <- x$getinverse()
  if (!is.null(p)) {
          message("getting cached data")
          return(p)
  }
  data <- x$get()  
  p <- solve(data, ...)
  x$setinverse(p)
  p
}

