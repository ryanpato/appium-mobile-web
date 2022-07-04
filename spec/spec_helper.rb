require 'appium_lib'
require 'require_all'

# 1. Determine platform
PLATFORM = ENV['PLATFORM']
IS_ANDROID = @platform == "ANDROID"
IS_IOS = @platform == "iOS"

# 2. Require all test related files
require_all 'spec/pages/*.rb'
require_all 'spec/helpers/*.rb'
require_all 'spec/utils/*.rb'

# 3. Create our options and capabilities for the driver (pending platform)
if IS_ANDROID
  options = {
    capabilities: {
      platformName: 'Android',
      platformVersion: '11.0',
      automationName: 'UIAutomator2',
      deviceName: 'emulator-5554',
      browserName: 'Chrome',
      enableMultiWindows: true
    }
  }
else
  options = {
    capabilities: {
      platformName: 'iOS',
      platformVersion: '15.5',
      automationName: 'XCUITest',
      deviceName: 'iPhone 13 Pro',
      browserName: 'Safari',
      autoDismissAlerts: true
    }
  }
end

options[:appium_lib] = {
  wait_timeout: 5
}

# 4. Configure the driver
RSpec.configure do |config|
  config.before(:all) do
    @driver = Appium::Driver.new(options, true).start_driver
    Appium.promote_appium_methods Object
  end

  config.after(:all) do
    if !@driver.nil?
      @driver.driver_quit
    end
  end
end
