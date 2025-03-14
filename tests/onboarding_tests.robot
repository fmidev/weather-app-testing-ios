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
Resource         ../resources/weather_view_resources.resource
Variables        ../variables/appium_setup_variables.py
Variables        ../variables/onboarding_variables.py
Variables        ../variables/dut_variables.py
Variables        ../variables/weather_view_variables.py
Suite Setup      Suite Setup Actions
Suite Teardown   Suite Teardown Actions

*** Test Cases ***
Open Mobile Weather App With Full Onboarding Successfully
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
    Click Location Setup Next Button
    Select Allow While Using App From Grant Locating Alert
    Verify Location Text From Upper Bar    ${DEFAULT_LOCATION}