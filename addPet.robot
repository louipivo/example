***Settings***
Library  SeleniumLibrary
Library  DateTime

***Variables***
${url}  localhost:8080

***Keywords***
BrowserOpen
    Open Browser  ${url}  browser=gc

FindOwner
    [Arguments]  ${lastname}
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner

VerifySearch
    [Arguments]  ${lastname}  ${firstname}
    Wait Until Page Contains  ${firstname} ${lastname}

AddPet
    [Arguments]  ${petname}  ${date}  ${type}
    ${date1}  Convert Date  ${date}  result_format=%Y-%m-%d  exclude_millis=true  date_format=%d.%m.%Y
    Click Element  //a[contains(., 'Add')]
    Wait Until Page Contains Element  //h2[normalize-space(text())="New Pet"]
    Input Text  id=name  ${petname}
    Input Text  id=birthDate  ${date1}
    Select From List By Value  id=type  ${type}
    Click Button  Add Pet
    

VerifyAdding
    Wait Until Page Does Not Contain Element  //h2[normalize-space(text())="New Pet"]
    Page Should Not Contain Element  //h2[normalize-space(text())="New Pet"]
    Wait Until Page Contains Element  //h2[text()="Pets and Visits"]
    Page Should Contain Element  //h2[text()="Pets and Visits"]

VerifyCreation
    [Arguments]  ${lastname}  ${petname}
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner
    Wait Until Page Contains  ${lastname}
    Wait Until Page Contains  ${petname}  
    Close Browser  

***Test Cases***
TestSukaDog
    BrowserOpen 
    FindOwner  Zalupkin
    VerifySearch  Zalupkin  Govnish
    AddPet  Suchka  01.02.1992  dog
    VerifyAdding
    VerifyCreation  Zalupkin  Suchka

