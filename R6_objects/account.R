Account <- R6Class(
    classname = "Account",
    public = list(
        overdraw_cost = 25,
        account_group = list(
            owner = NULL,
            saving = list(
                id = NULL,
                type = NULL,
                amount = 0
            ),
            checking = list(
                id = NULL,
                type = NULL,
                amount = 0
            )
        ),
        
        initialize = function(id,type,owner){
            stopifnot(!any(is.null(c(id,type,owner))))
            self$account_group$saving$id <- paste0(id,"saving")
            self$account_group$checking$id <- paste0(id,"checking")
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
            ohter_account_type <- c("saving","checking")[!(c("saving","checking") %in% account_type)]
            other_val <- self$account_group[[ohter_account_type]][["amount"]]
            total_val <- self$account_group$checking$amount + self$account_group$saving$amount
            
            if(amount > total_val + self$overdraw_cost){
                print("Withdraw failed, not enough amount in both saving and checking account.")
            } else if (amount > self_val){
                self$account_group[[account_type]][["amount"]] <- 0
                remaining <- amount - self_val
                self$account_group[[ohter_account_type]][["amount"]] <- 
                    other_val - remaining - self$overdraw_cost
                cat("Overdraw ", remaining, " from", ohter_account_type,".")
                cat("Additionally $25 overdraw cost deducted","\n")
                invisible(self)
            } else {
                self$account_group[[account_type]][["amount"]] <- self_val - amount
                invisible(self)
            }
        },
        
        check_amounts = function(){
            cat("Checking:", self$account_group$checking$amount,"\n")
            cat("Saving:", self$account_group$saving$amount,"\n")
            cat("Total:", self$account_group$checking$amount + self$account_group$saving$amount,"\n")
        }
    )
)
