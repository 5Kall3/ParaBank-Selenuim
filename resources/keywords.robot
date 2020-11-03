*** Settings ***
Library     SeleniumLibrary
Variables    ../locators/locators.py

*** Variables ***
${SELENIUM_TIMEOUT_TIME}    30 seconds
${URL_FOR_BROWSER}    https://www.google.com
${BROWSER_NAME}    chrome

*** Keywords ***
Open browser to front page
    Set Selenium Timeout    ${SELENIUM TIMEOUT TIME}
    Open browser    ${URL FOR BROWSER}    ${BROWSER NAME}

Check that Google opens
    Select frame    ${IFRAME}
    Wait until Element Is Visible   ${BEFORE YOU CONTINUE}

Close browser when done
    Close Browser