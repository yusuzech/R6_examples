source("R6_objects/account.R")
source("R6_objects/bank.R")

account_withdraw <- function(person,account_type,amount){
    person[[account_type]]$withdraw(amount)
}

account_deposit <- function(person,account_type,amount){
    person[[account_type]]$deposit(amount)
}


bankA <- Bank$new(name = "BankofA")

jacks_accounts <- bankA$issue_account_to("Jack")


bankA$list_accounts()

account_deposit(jacks_accounts,"checking",100)
account_withdraw(jacks_accounts,"checking",50)
jacks_accounts
