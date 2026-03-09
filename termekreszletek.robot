*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    loginKeywords.robot


*** Test Cases ***
Termekreszletek
    Login with standard user
    Termekoldal megnyitása név alapján
    Termekoldal megnyitása kép alapján
    Sleep    1s
    Close All Browsers



*** Keywords ***
Termekoldal megnyitása név alapján
    ${leiras1}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${ar1}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${nev1}=    Get Text    //*[@id="item_4_title_link"]/div
    ${kep1}=    Get Element Attribute    //*[@id="item_4_img_link"]/img    scr
    Click Element    //*[@id="item_4_title_link"]/div
    ${leiras2}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${ar2}=    Get Text        //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${nev2}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${kep2}=    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    scr
    Should Be Equal As Strings    ${kep1}    ${kep2}
    Should Be Equal As Strings    ${nev1}    ${nev2}
    Should Be Equal As Strings    ${ar1}    ${ar2}
    Should Be Equal As Strings    ${leiras1}    ${leiras2}
    Click Element    //*[@id="back-to-products"]


Termekoldal megnyitása kép alapján
    ${leiras1}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${ar1}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${nev1}=    Get Text    //*[@id="item_4_title_link"]/div
    ${kep1}=    Get Element Attribute    //*[@id="item_4_img_link"]/img    scr
    Click Element   //*[@id="item_4_img_link"]/img
    ${leiras2}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${ar2}=    Get Text        //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${nev2}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${kep2}=    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    scr
    Should Be Equal As Strings    ${kep1}    ${kep2}
    Should Be Equal As Strings    ${nev1}    ${nev2}
    Should Be Equal As Strings    ${ar1}    ${ar2}
    Should Be Equal As Strings    ${leiras1}    ${leiras2}
    Click Element    //*[@id="back-to-products"]