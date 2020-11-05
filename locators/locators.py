from __future__ import unicode_literals

# Parabank locators
PARABANK_TITLE = "//img[@title='ParaBank']"
USERNAME_INPUT = "name=username"
PASSWORD_INPUT = "name=password"
LOGIN_BUTTON = "//input[@value='Log In']"

ACCOUNTS_TITLE = "//h1[text()='Accounts Overview']"

# Locators for New Account
NEW_ACCOUNT_LINK = "//ul/li/a[text()='Open New Account']"
NEW_ACCOUNT_TITLE = "//h1[text()='Open New Account']"
ACCOUNT_TYPE_SELECTOR = "//select[@id='type']"
ACCOUNT_SAVINGS_BUTTON = "//select/option[@value=1]"
NEW_ACCOUNT_BUTTON = "//input[@type='submit']"
ACCOUNT_OPENED_TITLE = "//h1[text()='Account Opened!']"

# Validate New Account
NEW_ACCOUNT_ID = "id = newAccountId"
ACCOUNTS_OVERVIEW_LINK = "//ul/li/a[text()='Accounts Overview']"
ACCOUNT_DETAILS_TITLE = "//h1[text()='Account Details']"
ACCOUNT_TYPE_SAVINGS = "//td[text()='SAVINGS']"

# Requesting Loan
LOAN_LINK = "//ul/li/a[text()='Request Loan']"
REQUEST_LOAN_TITLE = "//h1[text()]"
LOAN_AMOUNT_INPUT = "//*[@id='amount']"
DOWN_PAYMENT_INPUT = "//*[@id='downPayment']"
APPLY_LOAN_BUTTON = "//input[@type='submit']"
LOAN_ACCEPTED_TITLE = "//h1[text()]"
# Request loan succsessfully
LOAN_APPROVED_TEXT = "//td[text()='Approved']"
# Request loan fail
LOAN_FAIL_TEXT = "//td[text()='Denied']"

# Transferring funds
TRANSFER_FUNDS_LINK = "//ul/li/a[text()='Transfer Funds']"
TRANSFER_FUNDS_TITLE = "//h1[text()='Transfer Funds']"
TRANSFER_AMOUNT = "//input[@id='amount']"
TRANSFER_FROM_SELECTOR = "//select[@id='fromAccountId']"
# TRANSFER_FROM_ID = ""
TRANSFER_TO_SELECTOR = "//select[@id='toAccountId']"
TRANSFER_BUTTON = "//input[@type='submit']"
FUNDS_TRANSFERED_TITLE = "//h1[text()='Transfer Complete!']"

# Pay bills
BILL_PAY_LINK = "//ul/li/a[text()='Bill Pay']"

# Create a new banking customer / Update customer info
SIGNING_UP_TITLE = "//h1[text()='Signing up is easy!']"
CUSTOMER_FIRST_NAME = "id=customer.firstName"
CUSTOMER_LAST_NAME = "id=customer.lastName"
CUSTOMER_ADDRESS = "id=customer.address.street"
CUSTOMER_CITY = "id=customer.address.city"
CUSTOMER_STATE = "id=customer.address.state"
CUSTOMER_ZIPCODE = "id=customer.address.zipCode"
CUSTOMER_PHONE = "id=customer.phoneNumber"
CUSTOMER_SSN = "id=customer.ssn"
CUSTOMER_USERNAME = "id=customer.username"
CUSTOMER_PASSWORD = "id=customer.password"
CUSTOMER_CONFIRM = "id=repeatedPassword"
CREATE_USER_BUTTON = "//td/input[@value='Register']"
USER_CREATED_TITLE = "//h1[text()]"

UPDATE_INFO_LINK = "//ul/li/a[text()='Update Contact Info']"
UPDATE_PROFILE_TITLE = "//h1[text()='Update Profile']"
UPDATE_USER_BUTTON = "//td/input[@value='Update Profile']"
USER_UPDATED_TITLE = "//h1[text()='Profile Updated']"

# Bill payee data
BILL_PAY_TITLE = "//h1[text()='Bill Payment Service']"
PAYEE_NAME = "name=payee.name"
PAYEE_ADDRESS = "name=payee.address.street"
PAYEE_CITY = "name=payee.address.city"
PAYEE_STATE = "name=payee.address.state"
PAYEE_ZIPCODE = "name=payee.address.zipCode"
PAYEE_PHONE = "name=payee.phoneNumber"
PAYEE_ACCOUNT = "name=payee.accountNumber"
CONFIRM_ACCOUNT = "name=verifyAccount"
PAY_AMOUNT = "name=amount"

SEND_PAYMENT_BUTTON = "//td/input[@value='Send Payment']"
PAYMENT_SENT_TITLE = "//h1[text()]"

# Log out
LOG_OUT_LINK = "//ul/li/a[text()='Log Out']"

ERROR_MESSAGE_TEXT = "class=error"

# ParaBank error messages
ERROR_MESSAGE_1 = "The username and password could not be verified."