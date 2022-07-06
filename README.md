# appium-mobile-web

A work-in-progress test-automation demonstration project for end-to-end (E2E) UI-Testing a mobile web-app/site cross platform utilising Ruby and Appium.

This branch uses ['Cucumber'](https://github.com/cucumber/cucumber-ruby).
Please see [`main`](https://github.com/ryanpato/appium-mobile-web/tree/main) for RSpec.

## How it works

Cucumber initiates `env.rb` which in turn:
- figures out what platform is to run based on an environment-variable "`Platform`"
- requires all relavent folders `helpers`, `pages`, `utils` etc
- creates appium capabilities for mobile-web browser testing per platform
- configures the driver and some start/stop rules
- tests run in succession

## Test example

```ruby
Feature: Search Results

	Scenario: User selects more results
		Given the page "https://duckduckgo.com"
		When the user searches for "Hello World!"
		And taps more results button
		Then the second page of content should be loaded
```

## Setup

**Prerequisites:**

- Appium
- Xcode
- Android Studio
- Applicable AVD & Simulators available

**Commands:**

- **Android:** `bundle exec cucumber PLATFORM=ANDROID`
- **iOS:** `bundle exec cucumber PLATFORM=iOS`
