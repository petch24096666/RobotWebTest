*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${browser}      Chrome
${url_lifeGadget}   http://45.144.164.182:8080/
${SearchBar}    xpath=//*[@id="header-section"]/div[2]/div/div/div[2]/div/form/input[2]
${SearchIcon}    xpath=//*[@id="header-section"]/div[2]/div/div/div[2]/div/form/button
${AddCartIcon}    xpath=//*[@id="product-81"]/div[2]/form/button
${CartIcon}    xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[1]/button
${CartPage}    xpath=//div[@class="cart-modal cart-modal-1 active-cart"]
${CheckOutButton}    xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[2]/div[1]/div[2]/div[2]/div[2]/a[3]
${FNameField}    xpath=//*[@id="billing_first_name"]
${LNameField}    xpath=//*[@id="billing_last_name"]
${Regionlist}    xpath=//*[@id="select2-billing_country-container"]
${HouseNumberField}    xpath=//*[@id="billing_address_1"]
${ApartmentNameField}    xpath=//*[@id="billing_address_2"]
${TownFeild}    xpath=//*[@id="billing_city"]
${ListState}    xpath=//*[@id="select2-billing_state-container"]
${PostCodeField}    xpath=//*[@id="billing_postcode"]
${PhoneField}    xpath=//*[@id="billing_phone"]
${EmailField}    xpath=//*[@id="billing_email"]
${Firstname}    Sorawit
${Lastname}    Auetrakul
${HouseNumber}    150
${StreetName}    Mahidol
${Apartment}    SalayaOne
${TownName}    ChinaTown
${PostCode}    10500
${Phone}    0981111111
${Email}    petch47758@gmail.com
${PlaceOrderButton}    xpath=//*[@id="place_order"]
${MicrophoneText}    Microphone
${LogitechMicrophoneItem}    xpath=//*[@id="st-primary-content"]/ul/li[1]/div/div/div[2]/div/h3/a
${CheckoutPath}    http://45.144.164.182:8080/checkout/    
${ProductNameInCart}    xpath=//*[@id="header-section"]/div[2]/div/div/div[3]/div/ul/li[1]/div[2]/div[1]/div[2]/div[1]/div/div/div[2]/div/div/span
${CompleteCheckOutPath}    http://45.144.164.182:8080/checkout/order-received/

*** Test Cases ***
Test Search and Checkout LifeGadget using Chrome
    Open Browser    ${url_lifeGadget}    ${browser}
    Maximize Browser Window
Test Search
    Click Element    ${SearchBar}
    Input Text    ${SearchBar}    ${MicrophoneText}
    Click Button    ${SearchIcon}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Search Results for “Microphone” – Life Gadget
Test Click Item
    Wait Until Element Is Visible    ${LogitechMicrophoneItem}    timeout=10s
    Click Element     ${LogitechMicrophoneItem}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    LOGITECH G YETI ORB RGB BLACK – Life Gadget
    ${path}=    Get Location
    Should Be Equal As Strings    ${path}    http://45.144.164.182:8080/product/logitech-g-yeti-orb-rgb-black/
Add to Cart
    Click Element    ${AddCartIcon}
    Sleep    3s
Check Out
    Click Element    ${CartIcon}
    ${product_name}=    Get Text    ${ProductNameInCart}
    Should Be Equal As Strings    ${product_name}    LOGITECH G YETI ORB RGB BLACK
    Page Should Contain Element    ${CartPage}
    Sleep    3s
    Click Element    ${CheckOutButton}
    ${path}=    Get Location
    Should Be Equal As Strings    ${path}    ${CheckoutPath}    
Input Data To Create Bill
    Input Text    ${FNameField}    ${Firstname}
    Input Text    ${LNameField}    ${Lastname}
    Input Text    ${HouseNumberField}    ${HouseNumber}
    Input Text    ${ApartmentNameField}    ${Apartment}
    Input Text    ${TownFeild}    ${TownName}
    Input Text    ${PostCodeField}    ${PostCode}
    Input Text    ${PostCodeField}    ${PostCode}
    Input Text    ${PhoneField}    ${Phone}
    Input Text    ${EmailField}    ${Email}
    Sleep    5s
Click PlaceOrder To checkout
    Click Button    ${PlaceOrderButton}
    Sleep    10s
    Wait Until Element Is Visible    css=section.woocommerce-order-details
    ${path}=    Get Location
    Should Contain    ${path}    ${CompleteCheckOutPath}
