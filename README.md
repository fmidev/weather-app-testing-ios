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
- `cd weather-app-testing-ios`
- To run all tests use `robot tests/`
- To run single test suite use `robot tests/test_suite_tests.robot`
