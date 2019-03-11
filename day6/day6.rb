require "pry-byebug"
require_relative "main_point"
array = []

File.open("day6.input").each_line do |line|
  array << line.chop
end

GRID = Array.new(400) { (1..400).to_a }

ALL_POINTS = []
array.each do |string|
  coordinates = string.split(",")
  new_point = MainPoint.new(x: coordinates[0].to_i, y: coordinates[1].to_i)
  ALL_POINTS << new_point
end

ALL_POINTS.each do |point|
  point.find_grid(ALL_POINTS)
end

non_infinites = ALL_POINTS.select { |point| !point.infinite? }

  #HOW DOES MIN BY WORK?

def unique_distance_to_point?
  # ALL_POINTS.sort_by { |obj| obj.distance_to_main }.first
  @distances = ALL_POINTS.map(&:distance_to_main)
  @sorted_distances = @distances.sort
  @closest = @sorted_distances.first
  @distances.one?(@closest)
end

def find_closest_locations
  test_point = ALL_POINTS.first
  GRID.each_with_index do |y_values, current_x|
    y_values.each do |current_y|
      ALL_POINTS.each do |point|
        point.distance_to_main = (point.x - current_x).abs + (point.y - current_y).abs
      end

      # THIS IS NEVER REACHED!
      if unique_distance_to_point?
        main_point = ALL_POINTS.find do |point|
          point.distance_to_main == @closest
        end
        main_point.points += 1
        # binding.pry
      end
    end
  end
end

find_closest_locations

# @winner = ALL_POINTS.sort_by { |obj| obj.points }.first
# p @winner.points

# USE NON-INFINITES NOW!

points = non_infinites.map(&:points)
# p points.sort

# PART 2, FIND REGION OF POINTS WITHIN 10_000

def find_region
  count = 0
  GRID.each_with_index do |y_values, current_x|
    y_values.each do |current_y|
      distance = 0
      ALL_POINTS.each do |point|
        distance += ((point.y - current_y).abs + (point.x - current_x).abs)
      end
      p distance
      count += 1 if distance < 10_000
    end
  end
  p count
end

nr = find_region
p nr

# CREATE A GRID WITH BLOCKING POINTS FOR EACH POINT

# find all points that are infinite:
# for each main point check top left down right, increase by one if there is a blocking point, multiply all, each point has an infinite hash

# NEXT, NOT USING A GRID:

# for all points that are not infinite, create a maximum rectangle for 4 closest ine each quadrant
# in that rectangle, iterate through all points and compare their distance to main point compared to its surrounding ones

# NEXT, USING A GRID:

#create grid from 4 outer points (400x400) (HOW DO I CREATE ARRAY WITH NRS 1 - 400)
#for all non_infinites, iterate throeugh all 16000 points and find the closest ones to this one
#find point with largest area

# INITIAL BRAINSTORM

# start off by creating all points on grid
# for each point there are 4 areas where it can have closest points (unless it is one of the 4 infinities)
# each one of the 4 areas has 1 point closest (method closest point in that grid)
# here iterate through all points that are closest to your current point
