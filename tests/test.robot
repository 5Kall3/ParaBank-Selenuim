*** Settings ***
Resource    ../resources/keywords.robot
Library    ../libraries/GenerateCustomerData.py
Suite Teardown    Close browser when done

*** Test Cases ***
Open ParaBank
    Open browser to front page
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

Apply for a Loan
    Request loan succsessful
    Request loan fail

Transfer funds to different account
    Transfer funds
    Transfer negative funds
    Transfer too many funds

Account Username & Password:
    Username and Password