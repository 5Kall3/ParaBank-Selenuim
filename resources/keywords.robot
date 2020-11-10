*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/GenerateCustomerData.py
Library    ../libraries/SeleniumExample.py
Variables    ../locators/locators.py

*** Variables ***
${SELENIUM_TIMEOUT_TIME}    10 seconds
${URL_FOR_BROWSER}    https://parabank.parasoft.com/parabank/index.htm
${BROWSER_NAME}    chrome

*** Keywords ***
Open ParaBank in browser
    Set Selenium Timeout    ${SELENIUM TIMEOUT TIME}
    Open browser    ${URL FOR BROWSER}    ${BROWSER NAME}

Open index page
    Wait Until Element Is Visible       ${PARABANK TITLE}

Close browser when done
    Close Browser

Wrong username
    Wait Until Element Is Visible    ${USERNAME INPUT}
    Input Text    ${USERNAME INPUT}    wrong
    Input Text    ${PASSWORD INPUT}    ${GENERATE PASSWORD}
    Click Button    ${LOGIN BUTTON}
    Wait Until Element Is Visible    ${ERROR MESSAGE TEXT}
    Element Text Should Be    ${ERROR MESSAGE TEXT}    ${ERROR MESSAGE 1}

Wrong password
    Wait Until Element Is Visible    ${PASSWORD INPUT}
    Input Text    ${USERNAME INPUT}    ${GENERATE USERNAME}
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
    Input Text    ${USERNAME INPUT}    ${GENERATE USERNAME}
    Input Text    ${PASSWORD INPUT}    ${GENERATE PASSWORD}
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
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Wait Until Element Is Visible    ${TRANSFER FUNDS TITLE}
    Input Text    ${TRANSFER AMOUNT}    50
    Click Element    ${TRANSFER TO SELECTOR}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Element    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Button    ${TRANSFER BUTTON}
    Wait Until Element Is Visible    ${FUNDS TRANSFERED TITLE}

Transfer negative funds
    Click Link    ${TRANSFER FUNDS LINK}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Wait Until Element Is Visible    ${TRANSFER FUNDS TITLE}
    Input Text    ${TRANSFER AMOUNT}    -100
    Click Element    ${TRANSFER TO SELECTOR}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Element    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Button    ${TRANSFER BUTTON}
    Wait Until Element Is Not Visible    ${ERROR_MESSAGE_TEXT}


Transfer too many funds
    Click Link    ${TRANSFER FUNDS LINK}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Wait Until Element Is Visible    ${TRANSFER FUNDS TITLE}
    Input Text    ${TRANSFER AMOUNT}    100000
    Click Element    ${TRANSFER TO SELECTOR}
    Wait Until Element Is Visible    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Element    //select[@id='toAccountId']/option[@value=${ACCOUNT NUMBER}]
    Click Button    ${TRANSFER BUTTON}
    Wait Until Element Is Not Visible    ${ERROR_MESSAGE_TEXT}

Pay bills
    Click Link    ${BILL PAY LINK}
    Wait Until Element Is Visible    ${BILL PAY TITLE}
    ${GENERATE PAYEE NAME} =    generate firstname
    ${GENERATE PAYEE ADDRESS} =    generate address
    ${GENERATE PAYEE CITY} =    generate city
    ${GENERATE PAYEE STATE} =    generate state
    ${GENERATE PAYEE ZIPCODE} =    generate zipcode
    ${GENERATE PAYEE PHONE} =    generate phonenumber
    ${GENERATE PAYEE ACCOUNT} =    generate payee account
    Input Text    ${PAYEE NAME}    ${GENERATE PAYEE NAME}
    Input Text    ${PAYEE ADDRESS}    ${GENERATE PAYEE ADDRESS}
    Input Text    ${PAYEE CITY}    ${GENERATE PAYEE CITY}
    Input Text    ${PAYEE STATE}    ${GENERATE PAYEE STATE}
    Input Text    ${PAYEE ZIPCODE}    ${GENERATE PAYEE ZIPCODE}
    Input Text    ${PAYEE PHONE}    ${GENERATE PAYEE PHONE}
    Input Text    ${PAYEE ACCOUNT}    ${GENERATE PAYEE ACCOUNT}
    Input Text    ${CONFIRM ACCOUNT}    ${GENERATE PAYEE ACCOUNT}
    Input Text    ${PAY AMOUNT}    25
    Click Button    ${SEND PAYMENT BUTTON}
    Wait Until Element Is Visible    ${PAYMENT SENT TITLE}

    # Get the trasnaction ID
    python click    ${ACCOUNTS OVERVIEW LINK}
    python is displayed    //td/a[text()="${ACCOUNT NUMBER}"]
    python click    //td/a[text()="${ACCOUNT NUMBER}"]
    python is displayed    ${ACCOUNT DETAILS TITLE}
    python click    //td/a[text()='Funds Transfer Received']
    python is displayed    //h1[text()='Transaction Details']
    ${TRANSACTION ID} =    Get Text    //tbody/tr[1]/td[2]
    Set Global Variable    ${TRANSACTION ID}

Create a new banking customer
    python click    ${REGISTER LINK}
    python is displayed    ${SIGNING UP TITLE}
    ${GENERATE FIRSTNAME} =    generate firstname
    ${GENERATE LASTNAME} =    generate lastname
    ${GENERATE ADDRESS} =    generate address
    ${GENERATE CITY} =    generate city
    ${GENERATE STATE} =    generate state
    ${GENERATE ZIPCODE} =    generate zipcode
    ${GENERATE PHONE} =    generate phonenumber
    ${GENERATE SSN} =    generate ssn
    ${GENERATE USERNAME} =    generate username
    Set Global Variable    ${GENERATE USERNAME}
    ${GENERATE PASSWORD} =    generate password
    Set Global Variable    ${GENERATE PASSWORD}
    Input Text    ${CUSTOMER FIRSTNAME}    ${GENERATE FIRSTNAME}
    Input Text    ${CUSTOMER LASTNAME}    ${GENERATE LASTNAME}
    Input Text    ${CUSTOMER ADDRESS}    ${GENERATE ADDRESS}
    Input Text    ${CUSTOMER CITY}    ${GENERATE CITY}
    Input Text    ${CUSTOMER STATE}    ${GENERATE STATE}
    Input Text    ${CUSTOMER ZIPCODE}    ${GENERATE ZIPCODE}
    Input Text    ${CUSTOMER PHONE}    ${GENERATE PHONE}
    Input Text    ${CUSTOMER SSN}     ${GENERATE SSN}
    Input Text    ${CUSTOMER USERNAME}    ${GENERATE USERNAME}
    Input Text    ${CUSTOMER PASSWORD}    ${GENERATE PASSWORD}
    Input Text    ${CUSTOMER CONFIRM}    ${GENERATE PASSWORD}

    Click Button    ${CREATE USER BUTTON}
    Wait Until Element Is Visible    ${USER CREATED TITLE}

Find transactions by amount
    python click    ${FIND TRANSACTIONS LINK}
    python is displayed    ${FIND TRANSACTION TITLE}
    python click    ${FIND_ACCOUNT SELECTOR}
    python is displayed    //select/option[@value=${ACCOUNT NUMBER}]
    python click    //select/option[@value=${ACCOUNT NUMBER}]
    python input text    ${AMOUNT CRITERIA INPUT}    50
    python click    ${FIND BY AMOUNT BUTTON}
    python is displayed   ${TRANSACTION_TO_FIND_BY_AMOUNT}

Find transactions by date
    python click    ${FIND TRANSACTIONS LINK}
    python is displayed    ${FIND TRANSACTION TITLE}
    python click    ${FIND_ACCOUNT SELECTOR}
    python is displayed    //select/option[@value=${ACCOUNT NUMBER}]
    python click    //select/option[@value=${ACCOUNT NUMBER}]
    ${GENERATE CURRENT DATE} =    generate current date
    python input text    ${DATE CRITERIA INPUT}    ${GENERATE CURRENT DATE}
    python click    ${FIND BY DATE BUTTON}
    python is displayed    //td[text()="${GENERATE CURRENT DATE}"]

Find transactions by date range
    python click    ${FIND TRANSACTIONS LINK}
    python is displayed    ${FIND TRANSACTION TITLE}
    python click    ${FIND_ACCOUNT SELECTOR}
    python is displayed    //select/option[@value="${ACCOUNT NUMBER}"]
    python click    //select/option[@value="${ACCOUNT NUMBER}"]
    ${GENERATE CURRENT DATE} =    generate current date
    ${GENERATE PAST DATE} =    generate past date
    python input text    ${DATE TO RANGE CRITERIA INPUT}    ${GENERATE CURRENT DATE}
    python input text    ${DATE FROM RANGE CRITERIA INPUT}    ${GENERATE PAST DATE}
    python click    ${FIND BY DATE RANGE BUTTON}
    python is displayed    //td[text()="${GENERATE CURRENT DATE}"]

Find transactions by id
    python click    ${FIND TRANSACTIONS LINK}
    python is displayed    ${FIND TRANSACTION TITLE}
    python click    ${FIND_ACCOUNT SELECTOR}
    python is displayed    //select/option[@value=${ACCOUNT NUMBER}]
    python click    //select/option[@value=${ACCOUNT NUMBER}]
    python input text    ${ID CRITERIA INPUT}    ${TRANSACTION ID}
    python click    ${FIND BY ID BUTTON}
    python is displayed    ${TRANSACTION_TO_FIND_BY_ID}

Update Contact info
    Click Link    ${UPDATE INFO LINK}
    Wait Until Element Is Visible    ${UPDATE PROFILE TITLE}
    ${GENERATE NEW FIRSTNAME} =    generate firstname
    ${GENERATE NEW LASTNAME} =    generate lastname
    ${GENERATE NEW ADDRESS} =    generate address
    ${GENERATE NEW CITY} =    generate city
    ${GENERATE NEW STATE} =    generate state
    ${GENERATE NEW ZIPCODE} =    generate zipcode
    ${GENERATE NEW PHONE} =    generate phonenumber
    Input Text    ${CUSTOMER FIRSTNAME}    ${GENERATE NEW FIRSTNAME}    clear=True
    Input Text    ${CUSTOMER LASTNAME}    ${GENERATE NEW LASTNAME}
    Input Text    ${CUSTOMER ADDRESS}    ${GENERATE NEW ADDRESS}
    Input Text    ${CUSTOMER CITY}    ${GENERATE NEW CITY}
    Input Text    ${CUSTOMER STATE}    ${GENERATE NEW STATE}
    Input Text    ${CUSTOMER ZIPCODE}    ${GENERATE NEW ZIPCODE}
    Input Text    ${CUSTOMER PHONE}    ${GENERATE NEW PHONE}

    Click Button    ${UPDATE USER BUTTON}
    Wait Until Element Is Visible    ${USER UPDATED TITLE}

Log out
    Click Link    ${LOG OUT LINK}

Username and Password
    Log    ${GENERATE USERNAME}
    Log    ${GENERATE PASSWORD}