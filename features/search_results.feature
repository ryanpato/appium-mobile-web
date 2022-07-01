Feature: Search Results

    Scenario: User selects more results
      Given the page "https://duckduckgo.com"
      When the user searches for "Hello World!"
      And taps more results button
			Then the second page of content should be loaded
