# Scroll Helper.
#
# Created by Ryan Paterson on 26/06/2022.
#

# Class to respresent coordinate point.
class Point
  attr_accessor :x, :y

  def initialize(x,y)
    @x, @y = x, y
  end
end

module Appium::Ios::Xcuitest::Gesture
  # Scrolls the driver window in a given direction until a given element is displayed.
  # 
  # @param [string] scroll direction (:up, :down, :left or :right symbols).
  # @option opts [Double] :attempts number of times to swipe before giving up.
  # @option opts [Double] :duration how long to perform the action in 'ms'. Only applicable to 'pause' and 'pointerMove'.
  # @option opts [Element] :to element to scroll to.
  #
  # Example:
  #   scroll(:up, to: target_element, attempts: 3, duration: 0.5)
  #
  # TODO: Add [from] container in the case you want to swipe a container inside the webview.
  def scroll(direction, to, attempts: 15, duration: 0.5)
    size = @driver.window_size
    center_x = size.width / 2
    center_y = size.height / 2
    start_point = Point.new(center_x, center_y)
    end_point = Point.new(0, 0)

    case direction
    when :up
      end_point = Point.new(start_point.x, start_point.y - 100)
    when :down
      end_point = Point.new(start_point.x, start_point.y + 100)
    when :left
      end_point = Point.new(start_point.x - 100, start_point.y)
    when :right
      end_point = Point.new(start_point.x + 100, start_point.y)
    end

    for index in 0..attempts - 1 do
      begin
        # Check if element is contained within the window
        struct = OpenStruct.new(to)
        element = @driver.find_element(struct.to.locator, struct.to.value)
        container_size = @driver.window_size
        element_rect = element.rect
        visible = element_rect.x > 0 && element_rect.x < container_size.width && element_rect.y > 0 && element_rect.y < container_size.height
        return true if visible
      rescue
        swipe(duration, start_point, end_point)
      end
    end
  end

  # Single finger swipe.
  # 
  # @param [Double] duration how long to perform the action in 'ms'. Only applicable to 'pause' and 'pointerMove'.
  # @param [Point] start_point the starting point point coordinates.
  # @param [Point] end_point the target destination point coordinates.
  #
  # Example:
  #   swipe(
  #     0.3,
  #     Point.new(20, 20),
  #     Point.new(20, 10)
  #   )
  #
  private def swipe(duration, start_point, end_point)
    origin = ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT
    f1 = ::Selenium::WebDriver::Interactions.pointer(:touch, name: 'finger1')
    f1.create_pointer_move(duration: duration, x: start_point.x, y: start_point.y, origin: origin)
    f1.create_pointer_down(:left)
    f1.create_pointer_move(duration: duration, x: end_point.x, y: end_point.y, origin: origin)
    f1.create_pointer_up(:left)
    @driver.perform_actions [f1]
  end
end
