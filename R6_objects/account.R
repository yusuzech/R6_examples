Account <- R6Class(
    classname = "Account",
    public = list(
        id = NULL,
        type = NULL,
        amount = 0,
        initialize = function(id,type){
            stopifnot(!is.null(id))
            stopifnot(!is.null(type))
            self$id = id
            self$type = type
        }
    )
)