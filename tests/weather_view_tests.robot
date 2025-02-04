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
Variables        ../variables/config_variables.py
#Test Setup       Start Simulator And Appium With App
#Test Setup       Set Appium Capabilities
Test Setup        Test Setup Actions
#Test Teardown    Run Keyword If Test Failed    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process

*** Test Cases ***
Verify 10-day Forecast Table View Elements
    Set Log Level    TRACE
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
#    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process
