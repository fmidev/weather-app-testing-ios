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
Resource         ../resources/weather_view_resources.resource
Resource         ../resources/search_view_resources.resource
Variables        ../variables/appium_setup_variables.py
Variables        ../variables/onboarding_variables.py
Variables        ../variables/dut_variables.py
Variables        ../variables/weather_view_variables.py
Suite Setup      Suite Setup Actions
Suite Teardown   Suite Teardown Actions
Test Setup       Test Setup Actions
Test Teardown    Set Default Weather View

*** Test Cases ***
Verify Other View Elements
    Verify Location Text From Upper Bar    ${DEFAULT_LOCATION}
    Open Other View