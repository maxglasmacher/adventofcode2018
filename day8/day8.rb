require "pry-byebug"
array = []

File.open("day8.input").each_line do |line|
  array << line.chop
end

p array

# Question: How are child nodes split
# up in layer, if they do not divide enenly?

# each layer has a calculate metadata method,
# layer added to layers array.
# each layer has a render next layer method, which creates new
# child nodes.
# continue calling methods consecutively

# look at all child nodes
# each child node look

# sections need to be finished one by one, not layer-wise! :
# each child_node, unless child_nodes.empty?, add up metadata,
# move to next child_node

# can you iterate over an array, as you iterate over items,
# you push new items? YES!!

# HENCE: each section has a lower levels array. Iterate and continue
# adding until done

# mark position where done, continue digging deeper from there


