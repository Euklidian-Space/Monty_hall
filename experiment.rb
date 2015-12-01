#this script is our experimentation with different variations of the Monty Hall problem

require_relative 'Monty.rb'
require_relative 'Host.rb'

#three_door_switch = Monty.new({switch:true,num_of_doors:3})
#three_door = Monty.new({switch:false,num_of_doors:3})


switch_hashes = []
stay_hashes = []
switch_objects = []
stay_objects = []

(3..10).each do |i|
  switch_hashes << {switch:true,num_of_doors:i,num_of_reveals:i - 2}
  stay_hashes << {switch:false,num_of_doors:i,num_of_reveals:i - 2}
end

switch_hashes.each do |t|
  switch_objects << Host.new(t)
end

stay_objects.each do |s|
  stay_objects << Host.new(s)
end
