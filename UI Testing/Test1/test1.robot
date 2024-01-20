*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${browser}      Chrome
${url_lifeGadget}   http://45.144.164.182:8080/
${SearchBar}    xpath=//*[@id="header-section"]/div[2]/div/div/div[2]/div/form/input[2]
${SearchIcon}    xpath=//*[@id="header-section"]/div[2]/div/div/div[2]/div/form/button
${MicrophoneText}    Microphone
${IPadText}    IPad
${USBText}    USB

*** Test Cases ***
Test Search LifeGadget using Chrome
    Open Browser    ${url_lifeGadget}    ${browser}
    Maximize Browser Window
Test Search Microphone
    Click Element    ${SearchBar}
    Input Text    ${SearchBar}    ${MicrophoneText}
    Click Element     ${SearchIcon}
    Sleep    3s
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Search Results for “Microphone” – Life Gadget
Test Search IPad
    Click Element    ${SearchBar}
    Input Text    ${SearchBar}    ${IPadText}
    Click Element     ${SearchIcon}
    Sleep    3s
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Search Results for “IPad” – Life Gadget
Test Search USB
    Click Element    ${SearchBar}
    Input Text    ${SearchBar}    ${USBText}
    Click Element     ${SearchIcon}
    Sleep    3s
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Search Results for “USB” – Life Gadget


