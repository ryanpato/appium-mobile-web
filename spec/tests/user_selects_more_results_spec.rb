require 'appium_lib'

# Data
url = "https://duckduckgo.com"
query = "Hello World! \n"

# Test
describe 'A user selects more results' do
	it 'Loads more results' do
		# Given a website
		@driver.get(url)

		# When the user submits a search query
		home_page = HomePage.new @driver
		home_page.search_bar.wait(:exist)
		home_page.search_bar.send_keys(query)

		# And taps 'more results' button
		results = ResultsPage.new @driver
		results.more_results_button.wait(:exist)
		results.more_results_button.click

		# Then the second page of content should load
		number_label = results.page_number_label
		number_label.wait(:exist)
		expect(number_label.text).to eq("2")
	end
end
