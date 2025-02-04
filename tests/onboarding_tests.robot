*** Settings ***
Documentation    This suite tests Onboarding process and views of FMI Mobile Weather app.
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
Variables        ../variables/appium_setup_variables.py
Variables        ../variables/onboarding_variables.py
Variables        ../variables/dut_variables.py
Variables        ../variables/config_variables.py
#Test Setup       Start Simulator And Appium With App
#Test Setup       Set Appium Capabilities
Test Setup        Test Setup Actions
Test Teardown     Run Keyword If Test Failed    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process

*** Test Cases ***
Open Mobile Weather App With Full Onboarding Successfully
    Verify Environment
    Weather Forecast And Observations Onboarding Icon Is Visible    ${OB_ICON_NAME_1}
    Weather Forecast And Observations Onboarding Title Is Visible    ${OB_WFO_TITLE_EN}
    Weather Forecast And Observations Onboarding Text Is Visible    ${OB_WFO_TEXT_EN}
    Click Next Button
    Map Onboarding Icon Is Visible    ${OB_ICON_NAME_1}
    Map Onboarding Title Is Visible    ${OB_MAP_TITLE_EN}
    Map Onboarding Text Is Visible    ${OB_MAP_TEXT_EN}
    Click Next Button
    Warnings Onboarding Icon Is Visible    ${OB_ICON_NAME_1}
    Warnings Onboarding Title Is Visible    ${OB_WAR_TITLE_EN}
    Warnings Onboarding Text Is Visible    ${OB_WAR_TEXT_EN}
    Click Next Button
    Customize Onboarding Icon Is Visible    ${OB_ICON_NAME_1}
    Customize Onboarding Title Is Visible    ${OB_CUS_TITLE_EN}
    Customize Onboarding Text Is Visible    ${OB_CUS_TEXT_EN}
    Click Next Button
    Terms Of Use Setup Title Is Visible    ${OB_TOU_TITLE_EN}
    Terms Of Use Setup Text Is Visible    ${OB_TOU_TEXT_EN}
    Accept Button Should Be Disabled
    Click Terms Of Use Button
    Click Close Button From Terms Of Use View
    Click Accept Button
    Location Setup Title Is Visible    ${OB_LOC_TITLE_EN}
    Location Setup Text Is Visible    ${OB_LOC_TEXT_EN}
    Click Next Button
    Grant Locating Alert Is Visible
    Select Allow While Using App From Grant Locating Alert
    Verify Location Text From Upper Bar    ${DEFAULT_LOCATION}
#    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process