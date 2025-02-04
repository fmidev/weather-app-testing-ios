*** Keywords ***
Start Yarn
    Start Process    yarn start    shell=yes    cwd=${CONFIG_YARN_PATH}    stdout=${CURDIR}/../stdout/yarn_stdout.txt    stderr=${CURDIR}/../stdout/yarn_stderr.txt    alias=yarn_process
    Wait For Process    yarn_process    timeout=20 seconds
    Process Should Be Running    yarn_process

Stop Yarn
    ${result}=    Terminate Process    yarn_process
    Process Should Be Stopped    yarn_process

Start Simulator
#    Start Process    npx    react-native    run-ios    --simulator\="${DEVICE_NAME}"    cwd=${CONFIG_SIMULATOR_PATH}    stdout=${CURDIR}/../stdout/simulator_stdout.txt    stderr=${CURDIR}/../stdout/simulator_stderr.txt    alias=simulator_process
    Start Process    npx    react-native    run-ios    --udid\=${CONFIG_DEVICE_UDID}    cwd=${CONFIG_SIMULATOR_PATH}    stdout=${CURDIR}/../stdout/simulator_stdout.txt    stderr=${CURDIR}/../stdout/simulator_stderr.txt    alias=simulator_process
    Wait For Process    simulator_process    timeout=180
    Process Should Be Running    simulator_process

Stop Simulator
    Run Process    killall    Simulator    alias=kill_simulator
    Terminate Process    simulator_process
    Process Should Be Stopped    kill_simulator
    Process Should Be Stopped    simulator_process

Start Simulator And Appium With App
    Start Appium Server
    Start Yarn
    Start Simulator
    Set Appium Capabilities
    Switch Process    simulator_process
    
Test Setup Actions
    ${is_local_env}=    Verify Environment
    IF    ${is_local_env}==${FALSE}
        Set Appium Capabilities
    ELSE IF    ${is_local_env}==${TRUE}
        Start Simulator And Appium With App
    ELSE
    
Verify Environment
    ${env_variables_dict}=    Get Environment Variables
    ${status}=    Get Status Is Key Found In Dictionary    ${env_variables_dict}    CI_ENV
    Log    ${env_variables_dict}
    Log    ${status}
    RETURN    ${status}