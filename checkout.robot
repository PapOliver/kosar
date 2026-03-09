*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    loginKeywords.robot


*** Test Cases ***
Checkout
    Login with standard user

    Checkoout Tesztelés
    Sleep    1s

    FirstName Postal code
    Sleep    1s

    FirstNameLastName
    Sleep    1s

    Empty
    Sleep    1s

    Long
    Sleep    1s

    Special
    Sleep    1s

    Number
    Sleep    1s

    Jo
    Sleep    1s
    
    Close All Browsers


*** Keywords ***
Checkoout Tesztelés

    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="last-name"]    text=asd
    Input Text    //*[@id="postal-code"]    text=asd
    Click Button    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

FirstName Postal code
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=asd
    Input Text    //*[@id="postal-code"]    text=asd
    Click Button    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

FirstNameLastName
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=asd
    Input Text    //*[@id="last-name"]    text=asd
    Click Button    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

Empty
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Click Button    //*[@id="continue"]
    Page Should Contain Element   //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

Long
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=A*100
    Input Text    //*[@id="last-name"]    text=A*100
    Input Text    //*[@id="postal-code"]    text=A*100
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

Special
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=$ß÷$ß&@
    Input Text    //*[@id="last-name"]    text=$ß÷$ß&@
    Input Text    //*[@id="postal-code"]    text=$ß÷$ß&@
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

Number
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=33333
    Input Text    //*[@id="last-name"]    text=22222
    Input Text    //*[@id="postal-code"]    text=11111
    Click Button    //*[@id="cancel"]
    Click Button    //*[@id="continue-shopping"]

Jo
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=Lakatos
    Input Text    //*[@id="last-name"]    text=Katatlan
    Input Text    //*[@id="postal-code"]    text=Cig
    Click Button    //*[@id="continue"]
    Click Button    //*[@id="cancel"]