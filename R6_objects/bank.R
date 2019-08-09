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
            account_id1 <- paste0(self$name,self$number_of_accounts)
            account_id2 <- paste0(self$name,self$number_of_accounts + 1)
            
            checking <- Account$new(
                id = account_id1,
                type = "Checking",
                owner = owner_name,
                linked_account = account_id2,
                amount = 0
            )
            saving <- Account$new(
                id = account_id2,
                type = "Checking",
                owner = owner_name,
                linked_account = account_id1,
                amount = 0
            )
            
            new_account_set <- list(
                owner_name = list(
                    checking = checking,
                    saving = saving
                )
            )
            
            names(new_account_set) <- owner_name
            
            self$accounts = append(self$accounts,new_account_set)
            
            self$number_of_accounts <- self$number_of_accounts + 2
            
            return(
                list(
                    checking = checking,
                    saving = saving
                )
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
