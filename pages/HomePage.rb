class HomePage
	attr_accessor :driver

	def initialize(driver)
		@driver = driver
	end

	def cookie_banner_dismiss_button
		Element.new(:css, '.js-atb-banner-dismiss')
	end

	def cookie_banner_close_button
		Element.new(:css, '.js-atb-banner-close')
	end

	def search_bar
		Element.new(:css, '#search_form_input_homepage')
	end
end
