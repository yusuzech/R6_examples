source("R6_objects/account.R")
source("R6_objects/bank.R")


bankA <- Bank$new(name = "BankofA")

jacks_accounts <- bankA$issue_account_to("Jack")
tom_accounts <- bankA$issue_account_to("Tom")

bankA$list_accounts()


jacks_accounts$deposit(account_type = 'saving',amount = 500)
jacks_accounts$deposit(account_type = 'checking',amount = 50)
jacks_accounts$withdraw(account_type = 'saving',amount = 122)
jacks_accounts$check_amounts()


jacks_accounts$withdraw(account_type = 'saving',amount = 1000)

jacks_accounts$withdraw(account_type = 'checking',amount = 100)
jacks_accounts$check_amounts()
