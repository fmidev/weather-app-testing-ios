*** Keywords ***
Open Map View
    Wait Until Page Contains Element    accessibility_id=navigation_map
    Click Element                       accessibility_id=navigation_map
    Wait Until Element Is Visible       accessibility_id=map_layers_button