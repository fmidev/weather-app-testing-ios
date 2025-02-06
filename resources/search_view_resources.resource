*** Keywords ***
Open Search View
    Wait Until Page Contains Element    accessibility_id=search_header_button
    Click Element                       accessibility_id=search_header_button
    Wait Until Element Is Visible       accessibility_id=Find My Location

Enter Search Location
    [Arguments]    ${location}
    Input Text    xpath=(//XCUIElementTypeOther[@name="Enter location..."])[1]    ${location}

Select From Location Search Results
    [Arguments]    ${location}
    Wait Until Element Is Visible    xpath=//XCUIElementTypeButton[@name="${location}"]
    Click Element    xpath=//XCUIElementTypeButton[@name="${location}"]
    Verify Location Text From Upper Bar    ${location}





