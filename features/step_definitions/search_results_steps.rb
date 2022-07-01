# Pages
results_page = ResultsPage.new @driver
home_page = HomePage.new @driver

# Steps
Given('the page {string}') do |url|
	@driver.get(url)
end

When("the user searches for {string}") do |query|
	home_page.search_bar.wait(:exist)
	home_page.search_bar.send_keys("#{query} \n")
end

And("taps more results button") do
	results_page.more_results_button.wait(:exist)
	results_page.more_results_button.click
end

Then("the second page of content should be loaded") do
	number_label = results_page.page_number_label
	number_label.wait(:exist)
	expect(number_label.text).to eq("2")
end
