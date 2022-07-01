class ResultsPage
	attr_accessor :driver

	def initialize(driver)
		@driver = driver
	end

	def more_results_button
		MyElement.new(:css, ".result--more__btn")
	end

	def page_number_label
		MyElement.new(:css, ".result__pagenum")
	end
end
