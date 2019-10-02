***Settings***
Library  SeleniumLibrary

***Keywords***
Prüfe, dass die Maske Owner Information geladen wird
    Wait Until Page Contains Element  //h2[text()="Pets and Visits"]
    Page Should Contain Element  //h2[text()="Pets and Visits"]

Click Add New Pet
    Click Element  //a[contains(., 'Add')]
    Wait Until Page Contains Element  //h2[normalize-space(text())="New Pet"]
