*** Settings ***
Resource    ../resources/keywords.robot
Suite Teardown    Close browser when done

*** Test Cases ***
Test case 1 Open browser and Check that Google opens correctly
    Open browser to front page
    Check that Google opens