***Settings***
Library  SeleniumLibrary
Library  DateTime

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