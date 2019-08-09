Account <- R6Class(
    classname = "Account",
    public = list(
        id = NULL,
        type = NULL,
        owner = NULL,
        linked_account = NULL,
        amount = 0,
        initialize = function(id,type,owner,linked_account,amount){
            stopifnot(!is.null(id))
            stopifnot(!is.null(type))
            self$id <- id
            self$type <- type
            self$owner <- owner
            self$linked_account <- linked_account
            self$amount <- amount
        },
        
        print = function(){
            cat("Account ID: ",self$id,"\n")
            cat("Account Type: ",self$type,"\n")
            cat("Account Owner: ",self$owner,"\n")
            cat("Linked Account:",self$linked_account,"\n")
            cat("Account Amount: ",self$amount,"\n")
        },
        
        deposit = function(amount){
            stopifnot(amount > 0)
            self$amount <- self$amount + amount
            invisible(self)
        },
        
        withdraw = function(amount){
            stopifnot(amount > 0)
            if(amount > self$amount){
                stop("Not Enough balance")
            } else {
                self$amount <- self$amount - amount
                invisible(self)
            }
        }
    )
)
