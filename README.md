# appium-mobile-web

A work-in-progress test-automation demonstration project for end-to-end (E2E) UI-Testing a mobile web-app/site cross platform utilising Ruby and Appium.

This branch uses [`Rspec`](https://rspec.info/).
Please see [`rp/cucumber`](https://github.com/ryanpato/appium-mobile-web/tree/rp/cucumber) for [`Cucumber`](https://github.com/cucumber/cucumber-ruby). :cucumber:

## 🧪 Tests

**Feature Example**
```ruby
describe 'A user selects more results' do
  # Test Data
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
```

**Output Example**
```ruby
appium-mobile-web % bundle exec rspec --format documentation

A user selects more results
  Loads more results

Finished in 7.44 seconds (files took 0.19961 seconds to load)
1 example, 0 failures
```

## :running: Run

- **Android:** `PLATFORM=ANDROID rspec --format documentation`
- **iOS:** `PLATFORM=iOS rspec --format documentation`

## :notebook: Notes

- Unlike iOS, Android had a toast-message-like popup "Try DuckDuckGoApp" that needed to be dismissed. As such I added a pretty rough solution in and whether that check is exected is based on a platform flag.
