Bank <- R6Class(
    classname = "Bank",
    public = list(
        name = NULL,
        initialize = function(name){
            stopifnot(!is.null(name))
            self$name <- name
        },
        issue_account <- function(applicant_id){
            
        }
    )
)