Account <- R6Class(
    classname = "Account",
    public = list(
        account_group = list(
            owner = NULL,
            saving = list(
                id = NULL,
                type = NULL,
                amount = 0,
            ),
            checking = list(
                id = NULL,
                type = NULL,
                amount = 0,
            )
        ),
        
        initialize = function(id,type,owner){
            stopifnot(!any(is.null(id,type,owner)))
            self$account_group$saving$id <- paste0(id,"saving")
            self$account_group$checking$id <- paste0(id,"saving")
            self$account_group$saving$type <- "saving"
            self$account_group$checking$type <- "checking"
            self$account_group$owner <- owner
        },
        
        print = function(){
            print(self$account_group)
        },
        
        deposit = function(account_type,amount){
            stopifnot(amount > 0)
            stopifnot(account_type %in% c("saving","checking"))
            self_val <- self$account_group[[account_type]][["amount"]]
            self$account_group[[account_type]][["amount"]] <- self_val + amount
            invisible(self)
        },
        
        withdraw = function(account_type,amount){
            stopifnot(amount > 0)
            stopifnot(account_type %in% c("saving","checking"))
            self_val <- self$account_group[[account_type]][["amount"]]
            
            if(amount > self_val){
                print("withdraw Failed")
            } else {
                self$account_group[[account_type]][["amount"]] <- self_val - amount
                invisible(self)
            }
        }
    )
)
