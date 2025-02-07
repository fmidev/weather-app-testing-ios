*** Settings ***
Documentation    This suite tests FMI Mobile Weather app Weather view functionality and elements.
Library          AppiumLibrary
Library          OperatingSystem
Library          Process
Library          String
Library          Collections
Library          ../libraries/fmi_custom_library.py
Resource         ../resources/appium_resources.resource
Resource         ../resources/dut_resources.resource
Resource         ../resources/process_resources.resource
Resource         ../resources/onboarding_resources.resource
Resource         ../resources/weather_view_resources.resource
Resource         ../resources/search_view_resources.resource
Variables        ../variables/weather_view_variables.py
Variables        ../variables/appium_setup_variables.py
Variables        ../variables/onboarding_variables.py
Variables        ../variables/dut_variables.py
Test Setup        Test Setup Actions
Test Teardown     Run Keyword If Test Failed    Test Teardown Actions

*** Test Cases ***
Verify 10-day Forecast Table View Elements
    Weather Forecast And Observations Onboarding Title Is Visible    ${OB_WFO_TITLE_EN}
    Click Onboarding Skip Button
    Terms Of Use Setup Title Is Visible    ${OB_TOU_TITLE_EN}
    Terms Of Use Setup Text Is Visible    ${OB_TOU_TEXT_EN}
    Accept Button Should Be Disabled
    Click Terms Of Use Button
    Click Close Button From Terms Of Use View
    Click Accept Button
    Location Setup Title Is Visible    ${OB_LOC_TITLE_EN}
    Location Setup Text Is Visible    ${OB_LOC_TEXT_EN}
    Click Location Setup Next Button
    Select Allow While Using App From Grant Locating Alert
    Verify Location Text From Upper Bar    ${DEFAULT_LOCATION}
    Open Weather View
    Open Search View
    Enter Search Location    Helsinki
    Select From Location Search Results    Helsinki
    Verify Forecast Time
    Verify Forecast Length    10
    Click Weather View Button    ${FORECAST_TABLE_BUTTON_NAME}
    Verify Table Is Active    10
    Verify Parameters Button Is Enabled
    Verify Parameters Info Button Is Enabled
    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process
