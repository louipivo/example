***Settings***
Library  SeleniumLibrary
Library  DateTime
Resource  maskFindOwner.robot
Resource  maskAddVisit.robot
Resource  maskAddPet.robot



***Variables***
${url}  localhost:8080
&{Verifying}  lastname=Zalupkin  firstname=Govnish  petname=Suchka
&{Visit_Data}  petname=Suchka  description=hotdog  after_x_days=25


***Keywords***
#Open Browser  ${url}  browser=gc
Füge einen Tier hinzu
    [Arguments]  ${petname}  ${date}  ${type}
    Click Add New Pet
    Prüfe, dass die Maske add pet geladen wird
    AddPet  ${petname}  ${date}  ${type}
    Click Add Pet
    Prüfe, dass die Maske Owner Information geladen wird

VerifySearch
    [Arguments]  ${lastname}  ${firstname}  ${petname}
    Wait Until Page Contains  ${firstname} ${lastname} 
    Page Should Contain  ${firstname} ${lastname} 
    Wait Until Page Contains  ${petname}
    Page Should Contain  ${petname}

VerifyAddingPet
    
    

VerifyCreationPet
    [Arguments]  ${lastname}  ${petname}
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner
    Wait Until Page Contains  ${lastname}
    Wait Until Page Contains  ${petname}  

VerifyAddingVisit
    Wait Until Page Does Not Contain Element  //h2[normalize-space(text())="New Visit"]
    Page Should Not Contain Element  //h2[normalize-space(text())="New Visit"]
    Wait Until Page Contains Element  //h2[normalize-space(text())="Owner Information"]
    Page Should Contain Element  //h2[normalize-space(text())="Owner Information"]

VerifyCreationVisit
    [Arguments]  ${lastname}  ${petname}  ${planned_visit}
    Click Link  /owners/find
    Wait Until Page Contains Element  //h2[text()="Find Owners"]
    Page Should Contain Element  //h2[text()="Find Owners"]
    Input Text  id=lastName  ${lastname}
    Click Button  Find Owner
    Wait Until Page Contains  ${lastname}
    Wait Until Page Contains  ${petname}  
    Wait Until Page Contains  ${planned_visit} 







