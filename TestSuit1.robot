*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Suite Setup       Log To Console    Test Suite Started
Suite Teardown    Log To Console    Test Suite Completed
Library           SeleniumLibrary

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/
@{CREDENTIAL}     Admin    admin123
&{LOGIN}          Username=Admin    Password=admin123

*** Test Cases ***
Valid Login
    [Tags]    test1
    [Setup]    Log To Console    Test Case Started
    Open Browser    ${url}    chrome
    Login
    Close Browser
    [Teardown]    Log To Console    Test Case Completed

*** Keywords ***
Login
    Input Text    xpath=//input[@id='txtUsername']    ${CREDENTIAL}[0]
    Input Password    xpath=//input[@id='txtPassword']    ${LOGIN}.[Password]
    Click Button    xpath=//input[@id='btnLogin']
