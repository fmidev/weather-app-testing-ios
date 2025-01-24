*** Keywords ***
Set Appium Capabilities
    [Arguments]    ${pv}=${PLATFORM_VERSION}    ${dn}=${DEVICE_NAME}
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${pv}
    ...    deviceName=${dn}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${APP_PACKAGE}

Start Appium Server
    Start Process    appium --base-path /wd/hub/    shell=yes    stdout=DEVNULL    stderr=DEVNULL    alias=appium_server_process
    Wait For Process    appium_server_process    timeout=30 seconds
    Process Should Be Running    appium_server_process

Stop Appium Server
    ${result}=    Terminate Process    appium_server_process
    Process Should Be Stopped    appium_server_process