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
    Sleep    0.5s
    Click Button    ${NEW ACCOUNT BUTTON}
    Wait Until Element Is Visible    ${ACCOUNT OPENED TITLE}

Validate New Account
    ${ACCOUNT NUMBER} =    Get Text    ${NEW ACCOUNT ID}
    Set Global Variable    ${ACCOUNT NUMBER}
    Click Link    ${ACCOUNTS OVERVIEW LINK}
    Wait Until Page Contains    ${ACCOUNT NUMBER}
    Click Link    ${ACCOUNT NUMBER}
    Wait Until Element Is Visible    ${ACCOUNT DETAILS TITLE}
    Wait Until Element Is Visible    ${ACCOUNT TYPE SAVINGS}

Request loan succsessful
    Click Link    ${LOAN LINK}
    Wait Until Element Is Visible    ${REQUEST LOAN TITLE}
    Input Text    ${LOAN AMOUNT INPUT}    10
    Input Text    ${DOWN PAYMENT INPUT}    5
    Click Button    ${APPLY LOAN BUTTON}
    Wait Until Element Is Visible    ${LOAN APPROVED TEXT}

Request loan fail
    Click Link    ${LOAN LINK}
    Wait Until Element Is Visible    ${REQUEST LOAN TITLE}
    Input Text    ${LOAN AMOUNT INPUT}    1000
    Input Text    ${DOWN PAYMENT INPUT}    1000
    Click Button    ${APPLY LOAN BUTTON}
    Wait Until Element Is Visible    ${LOAN FAIL TEXT}

Transfer funds
    Click Link    ${TRANSFER FUNDS LINK}
    Sleep    0.5s
    Wait Until Element Is Visible    ${TRANSFER FUNDS TITLE}
    Input Text    ${TRANSFER AMOUNT}    50
    Click Element    ${TRANSFER TO SELECTOR}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Element    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Button    ${TRANSFER BUTTON}
    Wait Until Element Is Visible    ${FUNDS TRANSFERED TITLE}

Transfer negative funds
    Click Link    ${TRANSFER FUNDS LINK}
    Sleep    0.5s
    Wait Until Element Is Visible    ${TRANSFER FUNDS TITLE}
    Input Text    ${TRANSFER AMOUNT}    -100
    Click Element    ${TRANSFER TO SELECTOR}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Element    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Button    ${TRANSFER BUTTON}
    Wait Until Element Is Visible    ${FUNDS TRANSFERED TITLE}

Transfer too many funds
    Click Link    ${TRANSFER FUNDS LINK}
    Sleep    0.5s
    Wait Until Element Is Visible    ${TRANSFER FUNDS TITLE}
    Input Text    ${TRANSFER AMOUNT}    100000
    Click Element    ${TRANSFER TO SELECTOR}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Element    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Button    ${TRANSFER BUTTON}
    Wait Until Element Is Visible    ${FUNDS TRANSFERED TITLE}