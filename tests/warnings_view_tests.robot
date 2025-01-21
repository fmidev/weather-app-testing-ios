*** Settings ***
Documentation    This suite tests FMI Mobile Weather app Warnings view functionality and elements.
Library          AppiumLibrary
Library          OperatingSystem
Library          Process
Library          String
Library          Collections
Resource         ../resources/appium_resources.resource
Resource         ../resources/dut_resources.resource
Resource         ../resources/process_resources.resource
Resource         ../resources/onboarding_resources.resource
Resource         ../resources/warnings_view_resources.resource
Variables        ../variables/appium_setup_variables.py
Variables        ../variables/onboarding_variables.py
Variables        ../variables/dut_variables.py
Variables        ../variables/config_variables.py
Test Setup       Start Simulator And Appium With App
Test Teardown    Run Keyword If Test Failed    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process

*** Test Cases ***
Verify Warnings View Elements
    Verify Location Text From Upper Bar    ${DEFAULT_LOCATION}
    Open Warnings View
    Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process