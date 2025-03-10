*** Keywords ***
Open Weather View
    Wait Until Page Contains Element    accessibility_id=navigation_weather
    Click Element                       accessibility_id=navigation_weather
    Swipe Down    ${2}
    Wait Until Element Is Visible       accessibility_id=info_button

Verify Forecast Time
    ${next_hour}=    Get Next Full Hour With Timezone
    Wait Until Page Contains Element    accessibility_id=Forecast at ${next_hour}

Verify Forecast Length
    [Arguments]    ${length}
    Wait Until Page Contains Element    accessibility_id=${length}-day forecast
    
Verify ${view_type} Is Active
    [Arguments]    ${length}=10
    IF    '${view_type}'=='Table'
        ${forecast_timezone_locator_name_attribute}=    Get Element Attribute    xpath=//XCUIElementTypeButton[@name="Locate"]/../following-sibling::XCUIElementTypeOther[1]    name
        ${is_timezone_viewed}=    Evaluate    "zone" in "${forecast_timezone_locator_name_attribute}"
        IF    ${is_timezone_viewed} == ${TRUE}
            ${current_timezone}=    Fetch From Right    ${forecast_timezone_locator_name_attribute}    Time zone:${SPACE}
            ${current_timezone_next_hour}=    Get Next Full Hour With Timezone    time_zone=${current_timezone}    time_format=%H
        ELSE
            ${current_timezone_next_hour}=    Get Next Full Hour With Timezone    time_format=%H
        END
        Wait Until Element Is Visible    xpath=//XCUIElementTypeOther[@name="${length}-day forecast"]/following-sibling::XCUIElementTypeOther[starts-with(@name,"m/s mm at ${current_timezone_next_hour}.")]
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
    
Set Default Weather View
    Open Weather View
    Swipe Down    ${2}
    Click Weather View Button    ${FORECAST_TABLE_BUTTON_NAME}
    Verify Table Is Active
    Set New Location From Search View    Helsinki