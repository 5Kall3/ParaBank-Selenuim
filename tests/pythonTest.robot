*** Settings ***
Resource    ../resources/keywords.robot
Library    ../libraries/GenerateCustomerData.py
Library    ../libraries/SeleniumExample.py
Suite Teardown    Close browser when done

*** Test Cases ***
Open ParaBank
    Open ParaBank in browser
    Open index page

Create a new banking account
    Create a new banking customer
