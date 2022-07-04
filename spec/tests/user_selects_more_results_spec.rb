require 'appium_lib'

describe 'A user selects more results' do
	url = "https://duckduckgo.com"
	query = "Hello World! \n"

	it 'Loads more results' do
		# Given a website
		@driver.get(url)

		# When the user submits a search query
		HOME_PAGE.search_bar.send_keys(query)

		# And taps 'more results' button
		RESULTS_PAGE.try_app_button.click if IS_ANDROID
		RESULTS_PAGE.more_results_button.click

		# Then the second page of content should load
		number_label = RESULTS_PAGE.page_number_label
		number_label.wait(:exist)
		expect(number_label.text).to eq("2")
	end
end
