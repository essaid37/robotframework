*** Settings ***

Library    SeleniumLibrary
Documentation
...    My First Test
...    This test will Verify Google

*** Keywords ***
Open Website
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Open Browser    https://www.google.com    chrome    options=${chrome_options}      executable_path=/usr/bin/chromedriver


Verify Page Contains Google
    ${Get_title}=                 Get Title
    Should Be Equal As Strings    ${Get_title}    Google
    Close Browser

*** Test Cases ***

Open Google & Verify Google
    Open Website
    Verify Page Contains Google