***Settings***
Library  SeleniumLibrary
Library  DateTime

***Variables***
${url}  localhost:8080

***Keywords***
AddPet
    [Arguments]  ${petname}  ${date}  ${type}
    ${date1}  Convert Date  ${date}  result_format=%Y-%m-%d  exclude_millis=true  date_format=%d.%m.%Y
    Input Text  id=name  ${petname}
    Input Text  id=birthDate  ${date1}
    Select From List By Value  id=type  ${type}

Click Add Pet
    Click Button  Add Pet

Prüfe, dass die Maske add pet geladen wird
    Wait Until Page Does Not Contain Element  //h2[normalize-space(text())="New Pet"]
    Page Should Not Contain Element  //h2[normalize-space(text())="New Pet"]