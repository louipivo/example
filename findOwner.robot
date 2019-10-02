***Settings***
Library  SeleniumLibrary

***Variables***
${url}  localhost:8080

***Keywords***
BrowserOpen 
    Open Browser  ${url}  browser=gc

FindOwnerNavigation 
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]

FindOwnerName
    [Arguments]  ${lastname}
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner

VerifySearch
    [Arguments]  ${lastname}  ${name}
    Wait Until Page Contains  ${name} ${lastname}

***Test Cases***
Test Eduardo Rodriquez
    BrowserOpen 
    FindOwnerNavigation 
    FindOwnerName  Rodriquez
    VerifySearch  Rodriquez  Eduardo
    Close Browser  

Test Davis
    BrowserOpen 
    FindOwnerNavigation 
    FindOwnerName  Davis
    VerifySearch  Davis  Betty
    VerifySearch  Davis  Harold
    Close Browser     
