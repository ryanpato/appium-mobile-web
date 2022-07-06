class ResultsPage
	attr_accessor :driver

	def initialize(driver)
		@driver = driver
	end

	def more_results_button
		Element.new(:css, ".result--more__btn")
	end

	def page_number_label
		Element.new(:css, ".result__pagenum")
	end

	# Exclusive to Android. This appears like a toast message at the bottom.
	# Can only be seen in Android inspector with 'enableMultiWindows' capability.
	def try_app_button
		Element.new(:css, '.js-atb-banner-close')
	end
end
