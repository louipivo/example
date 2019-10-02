***Settings***
Library  SeleniumLibrary

***Variables***
${url}  localhost:8080

***Test Cases***
Test
    Open Browser  ${url}  browser=gc
    Go To  http://localhost:8080/owners/find
    Input Text  id=lastName  хуй
    Click Button  Find Owner