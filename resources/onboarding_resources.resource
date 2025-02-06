*** Keywords ***
Click Next Button
    Click Element    accessibility_id=onboarding_next_button

${icon_view} Onboarding Icon Is Visible
    [Arguments]    ${icon_name}
    Wait Until Element Is Visible    xpath=//XCUIElementTypeOther[@name="${icon_name}"]
    
${title_text} Onboarding Title Is Visible
    [Arguments]    ${label}
    Wait Until Element Is Visible    xpath=//XCUIElementTypeOther[@name="onboarding_title_text" and contains(@label,"${label}")]
    
${title_text} Onboarding Text Is Visible
    [Arguments]    ${text}
    Element Value Should Be    xpath=//XCUIElementTypeStaticText[@name="onboarding_description_text"]    ${text}

${title_text} Setup Title Is Visible
    [Arguments]    ${label}
    Wait Until Element Is Visible    xpath=//XCUIElementTypeOther[@name="setup_title_text" and contains(@label,"${label}")]

${title_text} Setup Text Is Visible
    [Arguments]    ${text}
    Element Value Should Be    xpath=//XCUIElementTypeStaticText[@name="setup_description_text"]    ${text}

Grant Locating Alert Is Visible
    Wait Until Page Contains Element    xpath=//XCUIElementTypeAlert[@name="Allow “FMI Weather” to use your location?"]    timeout=10

Select ${selection} From Grant Locating Alert
    IF    '${selection}'=='Allow Once'
        Click Alert Button    Allow Once
    ELSE IF    '${selection}'=='Allow While Using App'
        Click Alert Button    Allow While Using App
    ELSE IF    '${selection}'=='Dont Allow'
        Click Alert Button    Don’t Allow
    END

Verify Location Text From Upper Bar
    [Arguments]    ${text}
    Wait Until Element Is Visible    xpath=(//XCUIElementTypeOther[contains(@name,"${text}")])[2]    timeout=60

Accept Button Should Be ${button_state}
    Wait Until Element Is Visible    accessibility_id=setup_primary_button
    IF    '${button_state}'=='Disabled'
        Element Should Be Disabled    accessibility_id=setup_primary_button
    ELSE IF    '${button_state}'=='Enabled'
        Element Should Be Enabled    accessibility_id=setup_primary_button
    END

Click Terms Of Use Button
    Click Element    accessibility_id=setup_secondary_button

Click Close Button From Terms Of Use View
    Wait Until Element Is Visible    accessibility_id=terms_close_button
    Click Element    accessibility_id=terms_close_button

Click Accept Button
    Accept Button Should Be Enabled
    Click Element    accessibility_id=setup_primary_button

Click Location Setup Next Button
    Click Element    accessibility_id=setup_primary_button