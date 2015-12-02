#this script is our experimentation with different variations of the Monty Hall problem
#May turn this into a module.

require_relative 'Monty.rb'
require_relative 'Host.rb'



switch_hashes = []
stay_hashes = []
switch_objects = []
stay_objects = []

(3..20).each do |i|
  switch_hashes << {switch:true,num_of_doors:i,num_of_reveals:i - 2}
  stay_hashes << {switch:false,num_of_doors:i,num_of_reveals:i - 2}
end

switch_hashes.each do |t|
  switch_objects << Host.new(t)
end

stay_objects.each do |s|
  stay_objects << Host.new(s)
end

switch_objects.each do |r|
  1000.times do
    r.run_sim
  end
  p r.switch_win
end

p "Incrementing reveals on 20 door case with switch..."

case_hashes = []
case_objects = []

(1..18).each do |h|
  case_hashes << {switch:true,num_of_doors:20,num_of_reveals:h}
end

case_hashes.each do |j|
  case_objects << Host.new(j)
end

case_objects.each do |k|
  1000.times do
    k.run_sim
  end
  p k.switch_win
end












#
