*** Keywords ***
Set Appium Capabilities
    [Arguments]    ${device_name}=%{DEVICE_NAME}    ${device_id}=%{UDID}    ${app}=${APP_PACKAGE}
    Open Application    http://127.0.0.1:4723/wd/hub
    ...    platformName=iOS
#    ...    platformVersion=%{IOS_VERSION}
    ...    deviceName=${device_name}
    ...    udid=${device_id}
    ...    automationName=XCUITest
    ...    app=${app}
    ...    appium:wdaLaunchTimeout=150000


Start Appium Server
#    Start Process    appium --base-path /wd/hub/    shell=yes    stdout=DEVNULL    stderr=DEVNULL    alias=appium_server_process
    Start Process    appium --base-path /wd/hub    shell=yes    stdout=${CURDIR}/../stdout/appium_stdout.txt    stderr=${CURDIR}/../stdout/appium_stderr.txt    alias=appium_server_process
    Wait For Process    appium_server_process    timeout=30 seconds
    Process Should Be Running    appium_server_process

Stop Appium Server
    ${result}=    Terminate Process    appium_server_process
    Process Should Be Stopped    appium_server_process