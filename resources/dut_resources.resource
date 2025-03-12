*** Keywords ***
Start Yarn
    Start Process    yarn start    shell=yes    cwd=${CONFIG_YARN_PATH}    stdout=${CURDIR}/../stdout/yarn_stdout.txt    stderr=${CURDIR}/../stdout/yarn_stderr.txt    alias=yarn_process
    Wait For Process    yarn_process    timeout=20 seconds
    Process Should Be Running    yarn_process

Stop Yarn
    ${result}=    Terminate Process    yarn_process
    Process Should Be Stopped    yarn_process

Start Simulator
    Start Process    npx    react-native    run-ios    --simulator\="${DEVICE_NAME_LOCAL_1}"    stdout=${CURDIR}/../stdout/simulator_stdout.txt    stderr=${CURDIR}/../stdout/simulator_stderr.txt    alias=simulator_process
    Wait For Process    simulator_process    timeout=180
    Process Should Be Running    simulator_process

Stop Simulator
    Run Process    killall    Simulator    alias=kill_simulator
    Terminate Process    simulator_process
    Process Should Be Stopped    kill_simulator
    Process Should Be Stopped    simulator_process

Start Simulator And Appium With App
    [Arguments]    ${platform_version}=${IOS_VERSION_LOCAL_1}    ${device_name}=${DEVICE_NAME_LOCAL_1}    ${device_id}=${DEVICE_ID_LOCAL_1}
    Start Yarn
    Start Simulator
    Start Appium Server
    Set Appium Capabilities    ${platform_version}    ${device_name}    ${device_id}
    Switch Process    simulator_process

Test Setup Actions
    ${is_onboarding_view}=    Return Onboarding View Status
    IF    ${is_onboarding_view}==${FALSE}
        Pass Onboarding Process If It Does Not Exist
    ELSE
        Run Skipped Onboarding Process
    END
    
Suite Setup Actions
    ${is_ci_env}=    Verify Environment
    IF    ${is_ci_env}==${TRUE}
        Set Appium Capabilities
    ELSE IF    ${is_ci_env}==${FALSE}
        Import Variables    ${CURDIR}/../variables/config_variables.py
        Start Simulator And Appium With App
    END

Suite Teardown Actions
    ${is_ci_env}=    Verify Environment
    IF    ${is_ci_env}==${TRUE}
        No Operation
    ELSE IF    ${is_ci_env}==${FALSE}
        Terminate All Processes Gracefully    simulator_process    appium_server_process    yarn_process
    END
    
Verify Environment
    ${env_variables_dict}=    Get Environment Variables
    ${status}=    Get Status Is Key Found In Dictionary    ${env_variables_dict}    CI_ENV
    RETURN    ${status}
    
Swipe Down
    [Arguments]    ${how_many_swipes}    ${start_x}=50    ${start_y}=20    ${end_x}=50    ${end_y}=80    ${duration}=1500
    FOR    ${index}    IN RANGE    ${how_many_swipes} + 1
        Swipe By Percent    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}
    END

Swipe Up
    [Arguments]    ${how_many_swipes}    ${start_x}=50    ${start_y}=80    ${end_x}=50    ${end_y}=20    ${duration}=1500
    FOR    ${index}    IN RANGE    ${how_many_swipes} + 1
        Swipe By Percent    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}
    END