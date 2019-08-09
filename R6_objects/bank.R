Bank <- R6Class(
    classname = "Bank",
    public = list(
        name = NULL,
        number_of_accounts = 0,
        accounts = NULL,
        linked_account = NULL,
        initialize = function(name){
            stopifnot(!is.null(name))
            self$name = name
        },
        
        issue_account_to = function(owner_name){
            account_id <- paste0(self$name,self$number_of_accounts)
            
            new_account <- Account$new(
                id = account_id,
                type = "Checking",
                owner = owner_name
            )
            
            
            self$accounts = append(self$accounts,new_account)
            
            self$number_of_accounts <- self$number_of_accounts + 1
            
            return(
                new_account
            )
        },
        
        print = function(){
            cat("Bank Name:",self$name,"\n")
            cat("Total Accounts owned:",self$number_of_accounts,"\n")
        },
        
        list_accounts = function(){
            print(self$accounts)
        }
    )
)
