class HomePage
	attr_accessor :driver

	def initialize(driver)
		@driver = driver
	end

	def search_bar
		MyElement.new(:id, "search_form_input_homepage")
	end
end
