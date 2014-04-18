    ## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
    ## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
    ## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

    ## This is an example to how to use
    ## > source('cachematrix.R')
    ## > m<-matrix(rnorm(12),2,2) ## Create any matrix 
    ## > makeM<-makeCacheMatrix(m) 
    ## > cacheSolve(makeM)
    ## > cacheSolve(makeM) ## This will get from the cache
 
    
  ## This function will accept matrix as and Input parameter and will create a special "matrix" object that can cache its inverse.This essentially does following tasks
        # set the value of the matrix
        # get the value of the matrix
        # set the value of the inverse matrix
        # get the value of the inverse matrix 

    makeCacheMatrix <- function(x = matrix()) {
          mInv <- NULL
          set <- function(y) {
            
            x <<- y
            mInv <<- NULL
          }
          
          get <- function() x
          setInverse <- function(solve) mInv<<- solve
          getInverse <- function() mInv
          
          list(set = set, get = get,
               setInverse = setInverse,
               getInverse = getInverse)      
    
    }
    
    
    ## The following function calculates the matrix inverse of the special "matrix" created with the above function. 
    ## However, it first checks to see if the inverse matrix has already been created. If so, it gets the inverse matrix from the cache and skips the computation. 
    ## Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.
    
    
    cacheSolve <- function(x, ...) {
            ## Return a matrix that is the inverse of 'x'
      
      mInv <- x$getInverse()
      if(!is.null(mInv)) {
        message("getting cached data")
        return(mInv)
      }
      data <- x$get()
      mInv <- solve(data)
      x$setInverse(m)
      mInv
      
      
    }
