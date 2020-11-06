*** Settings ***
Resource    ../resources/keywords.robot
Library    ../libraries/GenerateCustomerData.py
Suite Teardown    Close browser when done

*** Test Cases ***
Open ParaBank
    Open ParaBank in browser
    Open index page

Create a new banking account
    Create a new banking customer

Log out of ParaBank
    Log out

Login with wrong credentials
    Wrong password
    Wrong username
    Wrong both

Login with right credentials
    Login into ParaBank

Open new bank account
    Open new account
    Validate New Account

Pay bills to different account
    Pay bills

Apply for a Loan
    Request loan succsessful
    Request loan fail

Transfer funds to different account
    Transfer funds

Transfer negative funds to a different account
    Transfer negative funds

Transfer too many funds to a different account
    Transfer too many funds

Update account info
    Update Contact info

Account Username & Password:
    Username and Password