# Weather app iOS test automation

## **Prequisites**

- Node (20)
- XCode (16.1)
- Java JDK 17
- Python 3.12 ->
- At least one iOS simulator

## **Weather-app environment installation**

`git clone --recurse-submodules https://github.com/fmidev/weather-app.git`

`cd weather-app`

`yarn install --frozen-lockfile`

`cd ios`

`pod install`

## **Robot Framework and Python libraries installation**

`pip install robotframework`

`pip install robotframework-appiumlibrary`

`pip install robotframework-seleniumlibrary`

`pip install Appium-Python-Client`

`pip install pytz`

## **Appium installation**

`npm install -g appium`

`npm install -g appium-doctor`

`appium driver install xcuitest`

 install Appium Inspector from https://github.com/appium/appium-inspector/releases

## **Running Robot Framework tests locally**

- Clone test environment: https://github.com/fmidev/weather-app-testing-ios.git
- Before run make sure you have valid DefaultConfig.ts and WidgetConfig.ts in weather-app directory
- Create config_variables.py file to weather-app-testing-ios/variables folder. Folder should contain variables which represents local simulator or device and variable defining local yarn path:

  IOS_VERSION_LOCAL_1 = 'Here iOS platform version of the local device or simulator under test. E.g. 18.1'

  DEVICE_NAME_LOCAL_1 = 'Here name of the local device or simulator under test. E.g. iPhone 16 Pro'

  DEVICE_ID_LOCAL_1 = 'Here device id of the local device or simulator under test. E.g. 0888C6D3-22A1-2C41-8FB2-1C3BD6DD1501'

  CONFIG_YARN_PATH = 'Here yarn start path. E.g. $HOME//weather-app'

- `cd weather-app-testing-ios`
- To run all tests use `robot tests/`
- To run single test suite use `robot tests/test_suite_tests.robot`
