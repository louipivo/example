***Settings***
Library  SeleniumLibrary

***Variables***
${url}  localhost:8080

***Keywords***
BrowserOpen
    Open Browser  ${url}  browser=gc

CreateOwner
    [Arguments]  ${firstname}  ${lastname}  ${address}  ${city}  ${telephone}
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Click Link  /owners/new 
    Input Text  id=firstName  ${firstname}
    Input Text  id=lastName  ${lastname}
    Input Text  id=address  ${address}
    Input Text  id=city  ${city}
    Input Text  id=telephone  ${telephone}
    Click Button  Add Owner

VerifyAdding
    Wait Until Page Does Not Contain  Add Owner
    Page Should Not Contain  Add Owner
    Wait Until Page Contains  Owner Information
    Page Should Contain  Owner Information

VerifyCreation
    [Arguments]  ${firstname}  ${lastname}  ${address}  ${city}  ${telephone}
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner
    Wait Until Page Contains  ${firstname} ${lastname}
    Wait Until Page Contains  ${address}  
    Wait Until Page Contains  ${city}
    Wait Until Page Contains  ${telephone} 
    Close Browser  


***Test Cases***
Test Govniuk Govnoff
    BrowserOpen
    CreateOwner  Govniukkk  Govnoff  Chlenskaya street 120  Chlensk  666
    VerifyAdding
    VerifyCreation  Govniukkk  Govnoff  Chlenskaya street 120  Chlensk  666

${newDate}  Convert Date  ${oldDate}

Test add pet normal Date
    add pet  kaka cat  19-12-2009

Test add pet not normal Date
    add pet with date  19.12.2001