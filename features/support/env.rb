require 'appium_lib'
require 'require_all'

# 1.
require_all 'pages/*.rb'
require_all 'helpers/*.rb'
# require_all 'extensions/*.rb'

# 2.
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

# 3.
begin
	@driver = Appium::Driver.new(options, true).start_driver
	Appium.promote_appium_methods Object
rescue Exception => e
  puts e.message
  Process.exit(0)
end
