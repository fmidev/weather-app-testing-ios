*** Keywords ***
Set Appium Capabilities
#    [Arguments]    ${iv}=%{IOS_VERSION}    ${dn}=%{DEVICE_NAME}
#    [Arguments]    ${iv}=17.0    ${dn}=%{DEVICE_NAME}
#    [Arguments]    ${dn}=%{DEVICE_NAME}
#    Log    ${APPIUM_SERVER}
    Log    ${PLATFORM_NAME}
#    Log    ${iv}
#    Log    ${dn}
    Log    ${AUTOMATION_NAME}
    Log    ${APP_PACKAGE}
    Open Application    http://127.0.0.1:4723/wd/hub
    ...    platformName=${PLATFORM_NAME}
#    ...    platformVersion=${iv}
    ...    deviceName=%{DEVICE_NAME}
    ...    udid=%{UDID}
    ...    automationName=${AUTOMATION_NAME}
#    ...    app=com.apple.Preferences
    ...    app=${APP_PACKAGE}


Start Appium Server
#    Start Process    appium --base-path /wd/hub/    shell=yes    stdout=DEVNULL    stderr=DEVNULL    alias=appium_server_process
    Start Process    appium --base-path /wd/hub    shell=yes    stdout=${CURDIR}/../stdout/appium_stdout.txt    stderr=${CURDIR}/../stdout/appium_stderr.txt    alias=appium_server_process
    Wait For Process    appium_server_process    timeout=30 seconds
    Process Should Be Running    appium_server_process

Stop Appium Server
    ${result}=    Terminate Process    appium_server_process
    Process Should Be Stopped    appium_server_process