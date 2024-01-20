*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${browser}      Chrome
${url_lifeGadget}   http://45.144.164.182:8080/
${SearchBar}    xpath=//*[@id="header-section"]/div[2]/div/div/div[2]/div/form/input[2]
${SearchIcon}    xpath=//*[@id="header-section"]/div[2]/div/div/div[2]/div/form/button
${AddHyperxToCart}    xpath=//*[@id="product-68"]/div[2]/form/button
${AddIpadminiToCart}    xpath=//*[@id="product-84"]/div[2]/form/button
${CartIcon}    xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[1]/button
${CartPage}    xpath=//div[@class="cart-modal cart-modal-1 active-cart"]
${MicrophoneText}    Microphone
${LogitechMicrophoneItem}    xpath=//*[@id="st-primary-content"]/ul/li[1]/div/div/div[2]/div/h3/a
${CheckoutPath}    http://45.144.164.182:8080/checkout/    
${ProductNameInCart}   xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[2]/div[1]/div[2]/div[1]/div/div/div[2]/div/div/span
${ProductNameInCart2}    xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[2]/div[1]/div[2]/div[1]/div/div[2]/div[2]/div/div/span/a
${CompleteCheckOutPath}    http://45.144.164.182:8080/checkout/order-received/
${HyperxProduct}    xpath=//*[@id="st-primary-content"]/ul/li[2]/div/div/div[2]/div/h3/a
${BackHomepage}    xpath=//*[@id="header-section"]/div[2]/div/div/div[1]/div/a
${IPadMiniProduct}    xpath=//*[@id="st-primary-content"]/ul/li[1]/div/div/div[2]/div/h3/a
${CloseCartWindow}    xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[2]/div[1]/div[1]/div/a

*** Test Cases ***
Test Search and Add Product in Cart Using Chrome
    Open Browser    ${url_lifeGadget}    ${browser}
    Maximize Browser Window
Test Search
    Click Element    ${SearchBar}
    Input Text    ${SearchBar}    ${MicrophoneText}    Microphone
    Click Button    ${SearchIcon}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Search Results for “Microphone” – Life Gadget
Test Add Hyperx to Cart
    Click Element    ${HyperxProduct}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    HYPERX DUOCAST USB (BLACK) – Life Gadget
    ${path}=    Get Location
    Should Be Equal As Strings    ${path}    http://45.144.164.182:8080/product/hyperx-duocast-usb-black/
    Click Element    ${AddHyperxToCart}
    Click Element    ${CartIcon}
    ${product_name}=    Get Text    ${ProductNameInCart}
    Should Be Equal As Strings    ${product_name}    HYPERX DUOCAST USB (BLACK)
    Page Should Contain Element    ${CartPage}
    Sleep    3s
    Click Element    ${CloseCartWindow} 
    Click Element    ${BackHomepage}
Test Add Another Product and Check
    Click Element    ${SearchBar}
    Input Text    ${SearchBar}    IPad
    Click Button    ${SearchIcon}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Search Results for “IPad” – Life Gadget
    Click Element    ${IPadMiniProduct}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Apple iPad mini Gen6/256GB/8.3/Wi-Fi/STARLIGHT – Life Gadget
    ${path}=    Get Location
    Should Be Equal As Strings    ${path}    http://45.144.164.182:8080/product/apple-ipad-mini-gen6-256gb-8-3-wi-fi-starlight/
    Click Element    ${AddIpadminiToCart}
    Click Element    ${CartIcon}
    ${product_name2}=    Get Text    ${ProductNameInCart2}
    ${product_name}=    Get Text    ${ProductNameInCart}
    Should Be Equal As Strings    ${product_name2}    Apple iPad mini Gen6/256GB/8.3/Wi-Fi/STARLIGHT	
    Should Be Equal As Strings    ${product_name}    HYPERX DUOCAST USB (BLACK)									
    Page Should Contain Element    ${CartPage}
    Sleep    3s
    Click Element    ${CloseCartWindow} 
    Click Element    ${BackHomepage}



