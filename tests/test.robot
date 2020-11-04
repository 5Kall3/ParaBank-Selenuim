*** Settings ***
Resource    ../resources/keywords.robot
Suite Teardown    Close browser when done

*** Test Cases ***
Open ParaBank
    Open browser to front page
    Open index page

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
    Request loan

Transfer funds to different account
    Transfer funds