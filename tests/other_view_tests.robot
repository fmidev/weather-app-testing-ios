*** Settings ***
Documentation    This suite tests FMI Mobile Weather app Other view functionality and elements.
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
Resource         ../resources/other_view_resources.resource
Variables        ../variables/appium_setup_variables.py
Variables        ../variables/onboarding_variables.py
Variables        ../variables/dut_variables.py
Test Setup        Test Setup Actions
Test Teardown     Run Keyword If Test Failed    Test Teardown Actions

*** Test Cases ***
Verify Other View Elements
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
    Open Other View
    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process