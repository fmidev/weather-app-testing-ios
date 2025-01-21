*** Keywords ***
Open Other View
    Wait Until Page Contains Element    accessibility_id=navigation_others
    Click Element                       accessibility_id=navigation_others
    Wait Until Element Is Visible       accessibility_id=navigation_settings
    Wait Until Element Is Visible       accessibility_id=navigation_about
    Wait Until Element Is Visible       accessibility_id=navigation_terms_and_conditions
    Wait Until Element Is Visible       accessibility_id=navigation_accessibility
    Wait Until Element Is Visible       accessibility_id=navigation_feedback