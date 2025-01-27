*** Keywords ***
Start Yarn
    Start Process    yarn start    shell=yes    cwd=${CONFIG_YARN_PATH}    stdout=${CURDIR}/../stdout/yarn_stdout.txt    stderr=${CURDIR}/../stdout/yarn_stderr.txt    alias=yarn_process
    Wait For Process    yarn_process    timeout=20 seconds
    Process Should Be Running    yarn_process

Stop Yarn
    ${result}=    Terminate Process    yarn_process
    Process Should Be Stopped    yarn_process

Start Simulator
    ${path_before_simulator_start}=    Run Process    pwd
    Log    ${path_before_simulator_start.stdout}
#    Start Process    npx    react-native    run-ios    --simulator\="${DEVICE_NAME}"    cwd=${CONFIG_SIMULATOR_PATH}    stdout=${CURDIR}/../stdout/simulator_stdout.txt    stderr=${CURDIR}/../stdout/simulator_stderr.txt    alias=simulator_process
#    Start Process    yarn    ios    --simulator    ${DEVICE_NAME}    cwd=${CONFIG_SIMULATOR_PATH}    stdout=${CURDIR}/../stdout/simulator_stdout.txt    stderr=${CURDIR}/../stdout/simulator_stderr.txt    alias=simulator_process
    Start Process    yarn    ios    --no-packager    cwd=${CONFIG_SIMULATOR_PATH}    stdout=${CURDIR}/../stdout/simulator_stdout.txt    stderr=${CURDIR}/../stdout/simulator_stderr.txt    alias=simulator_process
    ${path_after_simulator_start}=    Run Process    pwd
    Log    ${path_after_simulator_start.stdout}
    Wait For Process    simulator_process    timeout=90
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