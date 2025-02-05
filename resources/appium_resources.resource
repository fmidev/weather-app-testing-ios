*** Keywords ***
Set Appium Capabilities
    [Arguments]    ${platform_version}=%{IOS_VERSION}    ${device_name}=%{DEVICE_NAME}    ${device_id}=%{UDID}    ${app}=${APP_PACKAGE}
    Log    ${platform_version}
    Log    ${device_name}
    Log    ${device_id}
    Log    ${app}
    TRY
        Open Application    ${APPIUM_SERVER}
        ...    platformName=iOS
        ...    platformVersion=${platform_version}
        ...    deviceName=${device_name}
        ...    udid=${device_id}
        ...    automationName=XCUITest
        ...    app=${app}
        ...    appium:processArguments={"args": ["e2e=true"]}
        ...    appium:wdaLaunchTimeout=${170000}
    EXCEPT    ProtocolError: *    type=GLOB
        Start Appium Server
        Open Application    ${APPIUM_SERVER}
        ...    platformName=iOS
        ...    platformVersion=${platform_version}
        ...    deviceName=${device_name}
        ...    udid=${device_id}
        ...    automationName=XCUITest
        ...    app=${app}
        ...    appium:wdaLaunchTimeout=${120000}
    END

Start Appium Server
    Start Process    appium --base-path /wd/hub    shell=yes    stdout=${CURDIR}/../stdout/appium_stdout.txt    stderr=${CURDIR}/../stdout/appium_stderr.txt    alias=appium_server_process
    Wait For Process    appium_server_process    timeout=30 seconds
    Process Should Be Running    appium_server_process

Stop Appium Server
    ${result}=    Terminate Process    appium_server_process
    Process Should Be Stopped    appium_server_process