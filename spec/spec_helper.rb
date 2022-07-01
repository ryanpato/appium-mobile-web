require 'appium_lib'
require 'require_all'

# 1. Require all test related files
require_all 'spec/pages/*.rb'
require_all 'spec/helpers/*.rb'
# require_all 'spec/extensions/*.rb'  # If no files found, exception thrown

# 2. Create our options and capabilities for the driver
options = {
	capabilities: {
		platformName: 'iOS',
		platformVersion: '15.5',
		automationName: 'XCUITest',
		deviceName: 'iPhone 13 Pro',
		browserName: 'Safari'
	},
	appium_lib: {
    wait_timeout: 5
  }
}

# 3. Configure the driver
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
