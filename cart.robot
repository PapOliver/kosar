 Kosár funkcionalitás
    Több termék hozzáadása
    Termék eltávolítása a kosárból
    Kosár tartalmának ellenőrzése

*** Settings ***
Library    Selenium2Library

*** Keywords ***
Login Saucedemo mainpage
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id:user-name    standard_user
    Input Password     id:password    secret_sauce
    Click Button    id:login-button

Verify cart item count
    [Arguments]    ${expected_count}
    ${item_count}=    Get Element Count    class:cart_item
    Should Be Equal As Integers    ${item_count}    ${expected_count}

Add items to cart
    Click Element    id:add-to-cart-sauce-labs-backpack
    Click Element     id:add-to-cart-sauce-labs-bike-light
    Click Element    id:add-to-cart-sauce-labs-bolt-t-shirt

Check price
    [Arguments]    ${price}
    Click Element    class:shopping_cart_badge
    ${price1}=    Get Text    class:inventory_item_price
    
    Should Be Equal As Strings    ${price1}    ${price}

*** Test Cases ***
Több termék hozzáadása
    Login Saucedemo mainpage
    Add items to cart

    Element Text Should Be    class:shopping_cart_badge     3
    Click Element    class:shopping_cart_badge

    Verify cart item count    3

    Page Should Contain    Sauce Labs Backpack
    Page Should Contain    Sauce Labs Bike Light
    Page Should Contain    Sauce Labs  Bolt T-shirt
    
    Close Browser

Remove Item from cart
    Login Saucedemo mainpage
    Add items to cart

    Click Element    class:shopping_cart_badge

    Verify cart item count    3

    Click Element    id:remove-sauce-labs-backpack
    Verify cart item count    2
    Page Should Contain    Sauce Labs Bike Light
    Page Should Contain    Sauce Labs  Bolt T-shirt

    Close Browser 

Price checking
    Login Saucedemo mainpage
    Add items to cart
    ${priceasd}=    Get Text    class:inventory_item_price
    Check price    ${priceasd}
    Close Browser
