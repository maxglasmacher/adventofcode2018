
class MainPoint
  attr_accessor :distance_to_main, :x, :y, :closest_quadrant_one, :closest_quadrant_two, :closest_quadrant_three, :closest_quadrant_four, :infinite, :points
  def initialize(attributes = {})
    @x = attributes[:x]
    @y = attributes[:y]
    @infinite = false
    @points = 0
  end

  def infinite?
    !(@directions.include?("T") && @directions.include?("L") && @directions.include?("B") && @directions.include?("R"))
  end

  def find_grid(all_points)
    @directions = []
    all_points.each do |point|
      if point.y > @y && (point.x - @x).abs <= (point.y - @y)
        @directions << "T"
      elsif point.x < @x && (point.y - @y).abs <= (@x - point.x)
        @directions << "L"
      elsif point.y < @y && (point.x - @x).abs <= (@y - point.y)
        @directions << "B"
      elsif point.x > @x && (point.y - @y).abs <= (point.x - @x)
        @directions << "R"
      end
    end
  end



  # def find_closest(all_points)
    # all_points.each do |point|
    #   if point.x >= @x && point.y >= @y
    #     options_quadrant_one = []
    #     point.distance_to_main = (point.x - @x) + (point.y - @y)
    #     options_quadrant_one << point
    #     @closest_quadrant_one = options_quadrant_one.sort_by { |obj| obj.distance_to_main }.first
    #   elsif point.x <= @x && point.y >= @y
    #     options_quadrant_two = []
    #     point.distance_to_main = (@x - point.x) + (point.y - @y)
    #     options_quadrant_two << point
    #     @closest_quadrant_two = options_quadrant_two.sort_by { |obj| obj.distance_to_main }.first
    #   elsif point.x <= @x && point.y <= @y
    #     options_quadrant_three = []
    #     point.distance_to_main = (@x - point.x) + (@y - point.y)
    #     options_quadrant_three << point
    #     @closest_quadrant_three = options_quadrant_three.sort_by { |obj| obj.distance_to_main }.first
    #   elsif point.x >= @x && point.y <= @y
    #     options_quadrant_four = []
    #     point.distance_to_main = (point.x - @x) + (@y - point.y)
    #     options_quadrant_four << point
    #     @closest_quadrant_four = options_quadrant_four.sort_by { |obj| obj.distance_to_main }.first
    #   end
    # end
  # end
end

