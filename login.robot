*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Login Test [Blank Field]
    Open Browser    https://www.kompas.com    edge
    Click Element    //div[@class='sso__header col-bs12-4']
    Click Element    id:txt_signin
    Click Element    //input[@value='Login']
    Page Should Contain    KG Media ID harus diisi
    Page Should Contain    Password harus diisi
    Reload Page

User doesn't have an account
    Input Text    id:email    fortechtest@gmail.com    #this email hasn't registered yet
    Input Password    id:password    password
    Click Element    //input[@value='Login']
    Page Should Contain    KG Media ID atau password yang kamu masukkan salah
    Reload Page

Login test - incorrect email
    Input Text    id:email    fortechtest@gmail.com    #this email hasn't registered yet
    Input Password    id:password    password          #password is correct
    Click Element    //input[@value='Login']
    Page Should Contain    KG Media ID atau password yang kamu masukkan salah
    Reload Page

Login test - incorrect password
    Input Text    id:email    forqatechtest@gmail.com    #email is correct
    Input Password    id:password    password123    #wrong password
    Click Element    //input[@value='Login']
    Page Should Contain    KG Media ID atau password yang kamu masukkan salah
    Reload Page

Login using google account
    Click Button    //button[@class='my-awesome-button button -theme-google']
    ${handle}=    Switch Window    NEW
    Input Text    //input[@type='email']    fortechtest@gmail.com    #[dummy email]-you can change with your google email account
    Press Keys    //input[@type='email']    ENTER
    Wait Until Element Is Visible    //input[@type='password']    #dummy password-change with your google password
    Input Text    //input[@type='password']    password        
    Press Keys    //input[@type='password']    ENTER
    ${handle}=    Switch Window    MAIN
    Wait Until Page Contains Element    id:sso__icon__login_top    timeout=10s
    Click Button    class:kgmModal-close
    Click Element    id:sso__icon__login_top
    Element Should Contain    //div[@class='sso__login__email text-nowrap']    forqatechtest@gmail.com
    Close Browser

Successfully login using email
    Open Browser    https://www.kompas.com    edge
    Click Element    //div[@class='sso__header col-bs12-4']
    Click Element    id:txt_signin
    Input Text    id:email    fortechtest@gmail.com      #dummy email-change with your registered email 
    Input Password    id:password    password123        #dummy password-change with  your password account
    Click Element    //input[@value='Login']
    Wait Until Page Contains Element    id:sso__icon__login_top    timeout=15s
    Click Element    id:sso__icon__login_top
    Element Should Contain    //div[@class='sso__login__email text-nowrap']    zonapengetahuan97@gmail.com
    Close Browser