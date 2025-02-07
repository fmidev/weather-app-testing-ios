*** Keywords ***
Open Weather View
    Wait Until Page Contains Element    accessibility_id=navigation_weather
    Click Element                       accessibility_id=navigation_weather
    Wait Until Element Is Visible       accessibility_id=info_button

Verify Forecast Time
    ${next_hour}=    Get Next Full Hour With Timezone
    Wait Until Page Contains Element    accessibility_id=Forecast at ${next_hour}

Verify Forecast Length
    [Arguments]    ${length}
    Wait Until Page Contains Element    accessibility_id=${length}-day forecast
    
Verify ${view_type} Is Active
    [Arguments]    ${length}
    IF    '${view_type}'=='Table'
        ${next_hour}=    Get Next Full Hour With Timezone    time_format=%H
        Wait Until Element Is Visible    xpath=//XCUIElementTypeOther[@name="${length}-day forecast"]/following-sibling::XCUIElementTypeOther[starts-with(@name,"m/s mm at ${next_hour}.")]
    ELSE IF    '${view_type}'=='Graph'
        Wait Until Element Is Visible    accessibility_id=chart_temperature
    END
    
Verify Parameters Button Is ${button_state}
    IF    '${button_state}'=='Enabled'
        Wait Until Page Contains Element    xpath=//XCUIElementTypeButton[@name="params_button" and @enabled="true"]
    ELSE IF    '${button_state}'=='Disabled'
        Wait Until Page Contains Element    xpath=//XCUIElementTypeButton[@name="params_button" and @enabled="false"]
    END

Verify Parameters Info Button Is ${button_state}
    IF    '${button_state}'=='Enabled'
        Wait Until Page Contains Element    xpath=//XCUIElementTypeButton[@name="info_button" and @enabled="true"]
    ELSE IF    '${button_state}'=='Disabled'
        Wait Until Page Contains Element    xpath=//XCUIElementTypeButton[@name="info_button" and @enabled="false"]
    END
    
Click Weather View Button
    [Arguments]    ${button_name}
    Wait Until Element Is Visible    xpath=//XCUIElementTypeButton[@name="${button_name}"]
    Click Element    xpath=//XCUIElementTypeButton[@name="${button_name}"]