# Class to respresent an element.
# 
# Standard Appium elements if not found will throw an exception causing the test to fail.
# However, sometimes you might want to scroll until an element exists. See (spec/helpers/helper.rb)
# My workaround is to have the elements in page-object-models (POM) defined in an object i.e [MyElement].
# This way I can wait to find an element, and the 'click' helper still allows me to interact from my POM instance.
#
class MyElement
  attr_accessor :locator
  attr_accessor :value

  def initialize(locator, value)
    @locator, @value = locator, value
  end

  def element
    @driver.find_element(@locator, @value)
  end

  def text
    element.text
	end

	def click
    element.click
	end

  def send_keys(query)
    element.send_keys(query)
  end

  def wait(to)
    case to
    when :exist
      wait_true { element }
    end
  end
end
