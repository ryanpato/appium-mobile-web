# Class to respresent an element.
# 
# Standard Appium elements if not found will throw an exception causing the test to fail.
# However, sometimes you might want to scroll until an element exists. See (spec/helpers/helper.rb)
# My workaround is to have the elements in page-object-models (POM) defined in an object i.e [Element].
# This way I can wait to find an element, and the 'click' helper still allows me to interact from my POM instance.
#
class Element
  attr_accessor :locator, :value

  def initialize(locator, value)
    @locator, @value = locator, value
  end

  # The Appium Element itself (Selenium::WebDriver::Element).
  #
  # - Note: An exception will be thrown if unable to find the given element.
  def element
    @driver.find_element(@locator, @value)
  end

  # The text value of the elemen (i.e label).
  def text
    element.text
	end

  # Click an element.
  # 
  # As click will throw an exception if unable to click, this method first waits for existance and displayed properties to be true.
  def click
    wait(:exist)
    wait(:displayed)
    element.click
	end

  # Send keys to the given element (i.e textfield).
  def send_keys(query)
    wait(:exist)
    element.send_keys(query)
  end

  # Wait for a given property value to match expectation.
  # TODO: Match property for e.g. negative values.
  # Example
  #   element.wait(:exist)
  #   element.wait(:displayed, matches: false) *Future idea
  def wait(to)
    case to
    when :exist
      wait_true { element }
    when :displayed
      wait_true { element.displayed? }
    end
  end
end
