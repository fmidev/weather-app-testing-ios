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
    Sleep    5
    TRY
        Click Location Alert Button    ${selection}
    EXCEPT    NoAlertPresentException: *    type=GLOB
        Wait Until Page Contains Element    accessibility_id=search_header_button
    EXCEPT
        Click Location Setup Next Button
        Click Location Alert Button    ${selection}
    END
    
Click Location Alert Button
    [Arguments]    ${button_label}
    IF    "${button_label}"=="Allow Once"
        Click Alert Button    Allow Once
    ELSE IF    "${button_label}"=="Allow While Using App"
        Click Alert Button    Allow While Using App
    ELSE IF    "${button_label}"=="Don’t Allow"
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

Click Onboarding Skip Button
    Wait Until Element Is Visible    accessibility_id=onboarding_skip_button    timeout=10
    Click Element    accessibility_id=onboarding_skip_button
    Wait Until Page Does Not Contain Element    accessibility_id=onboarding_skip_button

Run Skipped Onboarding Process
    Weather Forecast And Observations Onboarding Title Is Visible    ${OB_WFO_TITLE_EN}
    Click Onboarding Skip Button
    Accept Button Should Be Disabled
    Click Terms Of Use Button
    Click Close Button From Terms Of Use View
    Click Accept Button
    Location Setup Title Is Visible    ${OB_LOC_TITLE_EN}
    Click Location Setup Next Button
    Select Allow While Using App From Grant Locating Alert

Pass Onboarding Process If It Does Not Exist
    No Operation

Return Onboarding View Status
    Sleep    6
    ${is_onboarding_view}=    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=onboarding_skip_button
    RETURN    ${is_onboarding_view}