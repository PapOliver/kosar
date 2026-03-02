*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    loginKeywords.robot

*** Test Cases ***
Sort products Z to A
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get All Products
    Verify Z to A sorting    ${product_names}

    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get All Products
    Verify A to Z sorting    ${product_names}

    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${prices}=    Get All Prices
    Verify prices low to high    ${prices}

    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${prices}=    Get All Prices
    Verify prices high to low    ${prices}
    Sleep    2s
    Close Browser


*** Keywords ***
Get All Products
    ${products}=    Create List
    @{prucuct_elements}=    Get WebElements    class:inventory_item_name 
    FOR    ${element}    IN    @{prucuct_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}

Verify Z to A sorting
    [Arguments]    ${product_names}
    ${lenght}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    0    ${lenght}-1
        ${current}    Get From List    ${product_names}    ${i}
        ${next}    Get From List    ${product_names}    ${i+1}
        Should Be True    '${current}'>='${next}'
    END
    
Verify A to Z sorting
    [Arguments]    ${product_names}
    ${lenght}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    ${lenght}    0
        ${current}    Get From List    ${product_names}    ${i}
        ${next}    Get From List    ${product_names}    ${i+1}
        Should Be True    '${current}'<='${next}'
    END

Get All Prices
    ${price}=    Create List
    @{product_prices}=    Get WebElements    class:inventory_item_pirce
    FOR    ${item}    IN    @{product_prices}
        ${prices}=    Get Text    ${item}
        ${substring}=    Set Variable    ${prices}[1:6]
        Append To List   ${price}    ${substring}
    END
    RETURN    ${price}

Verify prices low to high
    [Arguments]    ${price}
    ${lenght}=    Get Length    ${price}
    FOR    ${i}    IN RANGE    ${lenght}    0
        ${current}    Get From List    ${price}    ${i}
        ${next}    Get From List    ${price}    ${i+1}
        Should Be True    '${current}'<='${next}'
    END

Verify prices high to low
    [Arguments]    ${price}
    ${lenght}=    Get Length    ${price}
    FOR    ${i}    IN RANGE    0    ${lenght}-1
        ${current}    Get From List    ${price}    ${i}
        ${next}    Get From List    ${price}    ${i+1}
        Should Be True    '${current}'<='${next}'
    END