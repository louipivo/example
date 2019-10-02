***Settings***
Library  SeleniumLibrary
Library  DateTime
Default Tags  TF1  TF2

***Variables***
${url}  localhost:8080
&{Verifying}  lastname=Zalupkin  firstname=Govnish  petname=Suchka
&{Visit_Data}  petname=Suchka  description=hotdog  after_x_days=25

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
    [Arguments]  ${lastname}  ${firstname}  ${petname}
    Wait Until Page Contains  ${firstname} ${lastname} 
    Page Should Contain  ${firstname} ${lastname} 
    Wait Until Page Contains  ${petname}
    Page Should Contain  ${petname}

AddVisit
    [Arguments]  ${petname}  ${description}  ${after_x_days}
    ${current_date}  Get Current Date  time_zone=local  increment=0  result_format=%Y-%m-%d  exclude_millis=False
    ${planned_visit}  Add Time To Date  ${current_date}  ${after_x_days} days  result_format=%Y-%m-%d  exclude_millis=False  date_format=%Y-%m-%d
    Click Element  //td[contains(., '${petname}')]/ancestor::tr//a[normalize-space(text())='Add Visit']
    Wait Until Page Contains Element  //h2[normalize-space(text())="New Visit"]
    Page Should Contain Element  //h2[normalize-space(text())="New Visit"]
    Input Text  id=date  ${planned_visit}
    Input Text  id=description  ${description}
    Click Button  Add Visit
    [Return]  ${planned_visit}

AddVisit1
    [Arguments]  &{DictData}
    ${current_date}  Get Current Date  time_zone=local  increment=0  result_format=%Y-%m-%d  exclude_millis=False
    ${planned_visit}  Add Time To Date  ${current_date}  &{DictData}[after_x_days] days  result_format=%Y-%m-%d  exclude_millis=False  date_format=%Y-%m-%d
    Click Element  //td[contains(., '&{DictData}[petname]')]/ancestor::tr//a[normalize-space(text())='Add Visit']
    Wait Until Page Contains Element  //h2[normalize-space(text())="New Visit"]
    Page Should Contain Element  //h2[normalize-space(text())="New Visit"]
    Input Text  id=date  ${planned_visit}
    Input Text  id=description  &{DictData}[description]
    Click Button  Add Visit
    [Return]  ${planned_visit}

VerifyAdding
    Wait Until Page Does Not Contain Element  //h2[normalize-space(text())="New Visit"]
    Page Should Not Contain Element  //h2[normalize-space(text())="New Visit"]
    Wait Until Page Contains Element  //h2[normalize-space(text())="Owner Information"]
    Page Should Contain Element  //h2[normalize-space(text())="Owner Information"]

VerifyCreation
    [Arguments]  ${lastname}  ${petname}  ${planned_visit}
    #${current_date}  Get Current Date  time_zone=local  increment=0  result_format=%Y-%m-%d  exclude_millis=False
    #${planned_visit}  Add Time To Date  ${current_date}  14 days  result_format=%Y-%m-%d  exclude_millis=False  date_format=%Y-%m-%d
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Page Should Contain Element  //h2[text()="Find Owners"]
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner
    Wait Until Page Contains  ${lastname}
    Wait Until Page Contains  ${petname}  
    Wait Until Page Contains  ${planned_visit} 
    Close Browser  


***Test Cases***
TestSuka
    [Tags]  TF1
    BrowserOpen
    FindOwner  Zalupkin
    VerifySearch  &{Verifying}
    ${visit}  AddVisit  &{Visit_Data}
    VerifyAdding
    VerifyCreation  Zalupkin  Suchka  ${visit}

Test Suka with another dict
    [Tags]  TF2
    BrowserOpen
    FindOwner  Zalupkin
    VerifySearch  &{Verifying}
    ${visit}  AddVisit1  &{Visit_Data}
    VerifyAdding
    VerifyCreation  Zalupkin  Suchka  ${visit}


#//tr[contains(., 'Suchka')]/td//a[contains(., 'Add')]

#//dd[text()='Suchka']/ancestor::tr/td//a[normalize-space(text())='Add Visit']

#//div[@class='container-fluid']

