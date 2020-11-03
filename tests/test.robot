*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Test case 1 Open browser and Check that Google opens correctly
    Open browser to front page
    Check that Google opens

Test case 2 Close browser
    Close browser when done