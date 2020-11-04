*** Settings ***
Library     SeleniumLibrary
Variables    ../locators/locators.py

*** Variables ***
${SELENIUM_TIMEOUT_TIME}    30 seconds
${URL_FOR_BROWSER}    https://parabank.parasoft.com/parabank/index.htm
${BROWSER_NAME}    chrome
${USERNAME}    default
${PASSWORD}    default

*** Keywords ***
Open browser to front page
    Set Selenium Timeout    ${SELENIUM TIMEOUT TIME}
    Open browser    ${URL FOR BROWSER}    ${BROWSER NAME}

Open index page
    Wait Until Element Is Visible       ${PARABANK TITLE}

Close browser when done
    Close Browser

Wrong username
    Wait Until Element Is Visible    ${USERNAME INPUT}
    Input Text    ${USERNAME INPUT}    wrong
    Input Text    ${PASSWORD INPUT}    ${PASSWORD}
    Click Button    ${LOGIN BUTTON}
    Wait Until Element Is Visible    ${ERROR MESSAGE TEXT}
    Element Text Should Be    ${ERROR MESSAGE TEXT}    ${ERROR MESSAGE 1}

Wrong password
    Wait Until Element Is Visible    ${PASSWORD INPUT}
    Input Text    ${USERNAME INPUT}    ${USERNAME}
    Input Text    ${PASSWORD INPUT}    wrong
    Click Button    ${LOGIN BUTTON}
    Wait Until Element Is Visible    ${ERROR MESSAGE TEXT}
    Element Text Should Be    ${ERROR MESSAGE TEXT}    ${ERROR MESSAGE 1}

Wrong both
    Wait Until Element Is Visible    ${USERNAME INPUT}
    Wait Until Element Is Visible    ${PASSWORD INPUT}
    Input Text    ${USERNAME INPUT}    wrong
    Input Text    ${PASSWORD INPUT}    wrong
    Click Button    ${LOGIN BUTTON}
    Wait Until Element Is Visible    ${ERROR MESSAGE TEXT}
    Element Text Should Be    ${ERROR MESSAGE TEXT}    ${ERROR MESSAGE 1}

Login into ParaBank
    Wait Until Element Is Visible    ${USERNAME INPUT}
    Wait Until Element Is Visible    ${PASSWORD INPUT}
    Input Text    ${USERNAME INPUT}    ${USERNAME}
    Input Text    ${PASSWORD INPUT}    ${PASSWORD}
    Click Button    ${LOGIN BUTTON}
    Wait Until Element Is Visible    ${ACCOUNTS TITLE}

Open new account
    Click Link    ${NEW ACCOUNT LINK}
    Wait Until Element Is Visible    ${NEW ACCOUNT TITLE}
    Click Element     ${ACCOUNT TYPE SELECTOR}
    Click Element     ${ACCOUNT SAVINGS BUTTON}
    Click Button    ${NEW ACCOUNT BUTTON}
    Wait Until Element Is Visible    ${ACCOUNT OPENED TITLE}
    ${ACCOUNT NUMBER} =    Get Text    ${NEW ACCOUNT ID}
    Click Link    ${ACCOUNTS OVERVIEW LINK}
    Wait Until Page Contains    ${ACCOUNT NUMBER}
    #TODO
    #Validate that the account is a savins account

Request loan
    Click Link    ${LOAN LINK}
    Wait Until Element Is Visible    ${REQUEST LOAN TITLE}
    Input Text    ${LOAN AMOUNT INPUT}    300
    Input Text    ${DOWN PAYMENT INPUT}    100
    Click Button    ${APPLY LOAN BUTTON}
    Wait Until Element Is Visible    ${LOAN ACCEPTED TITLE}