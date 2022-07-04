# appium-mobile-web

A work-in-progress test-automation demonstration project for end-to-end (E2E) UI-Testing a mobile web-app/site cross platform utilising Ruby and Appium.

This branch uses [`Rspec`](https://rspec.info/).
Please see [`rp/cucumber`](https://github.com/ryanpato/appium-mobile-web/tree/rp/cucumber) for [`Cucumber`](https://github.com/cucumber/cucumber-ruby). :cucumber:

## How it works

RSpec initiates `spec_helper.rb` which in turn:
- figures out what platform is to run based on an environment-variable "`Platform`"
- requires all relavent folders `helpers`, `pages`, `utils` etc
- creates appium capabilities for mobile-web browser testing per platform
- configures the driver and some start/stop rules
- tests run in succession

## Test example

```ruby
describe 'A user selects more results' do
  it 'Loads more results' do
    # Given a website
    @driver.get("https://duckduckgo.com")

    # When the user submits a search query
    HOME_PAGE.search_bar.send_keys("Hello World! \n")

    # And taps 'more results' button
    RESULTS_PAGE.try_app_button.click if IS_ANDROID
    RESULTS_PAGE.more_results_button.click

    # Then the second page of content should load
    number_label = RESULTS_PAGE.page_number_label
    number_label.wait(:exist)

    expect(number_label.text).to eq("2")
  end
end
```

## Setup

**Prerequisites:**

- Appium
- Xcode
- Android Studio
- Applicable AVD & Simulators available

**Commands:**

- **Android:** `PLATFORM=ANDROID rspec --format documentation`
- **iOS:** `PLATFORM=iOS rspec --format documentation`
