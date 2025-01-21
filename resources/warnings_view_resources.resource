*** Keywords ***
Open Warnings View
    Wait Until Page Contains Element    accessibility_id=navigation_warnings
    Click Element                       accessibility_id=navigation_warnings
    Wait Until Element Is Visible       accessibility_id=warnings_webview