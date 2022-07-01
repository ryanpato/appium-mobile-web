# appium-mobile-web

An simple test-automation demonstration project for end-to-end (E2E) UI-Testing a mobile (iOS currently) web-app/site. Utilising Ruby and Appium.

This branch uses ['Cucumber'](https://github.com/cucumber/cucumber-ruby).
Please see [`main`](https://github.com/ryanpato/appium-mobile-web/tree/main) for RSpec.

## Tests

**Feature Example**
```ruby
Feature: Search Results

	Scenario: User selects more results
		Given the page "https://duckduckgo.com"
		When the user searches for "Hello World!"
		And taps more results button
		Then the second page of content should be loaded
```

**Output**
```ruby
appium-mobile-web % bundle exec cucumber
Feature: Search Results

  Scenario: User selects more results                # features/search_results.feature:3
    Given the page "https://duckduckgo.com"          # features/step_definitions/steps.rb:1
    When the user searches for "Hello World!"        # features/step_definitions/steps.rb:5
    And taps more results button                     # features/step_definitions/steps.rb:11
    Then the second page of content should be loaded # features/step_definitions/steps.rb:17

1 scenario (1 passed)
4 steps (4 passed)
0m3.800s
```

## Run

`bundle exec cucumber`

