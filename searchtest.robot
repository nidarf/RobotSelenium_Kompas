*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Search Berita Test
    Open Browser    https://www.kompas.com    edge
    Input Text    id:search    Tom
    Press Keys    id:search    ENTER
    Wait Until Page Contains    Pencarian
    ${text}=    Get Text    //div[@class='gsc-expansionArea']/div[2]/div/div/div/a
    Click Element    //div[@class='gsc-expansionArea']/div[2]/div/div/div/a
    Wait Until Page Does Not Contain Element    //div[@class='gsc-expansionArea']
    Wait Until Page Contains Element    //h1[@class='read__title']
    Close Browser