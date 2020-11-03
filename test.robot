*** Settings ***
Library     BuiltIn
Library     SeleniumLibrary

*** Keywords ***
Open browser to front page
    Set Selenium Timeout    30 seconds
    Open browser    https://ww.google.com   chrome

*** Test Cases ***
Test case 1
    Open browser to front page