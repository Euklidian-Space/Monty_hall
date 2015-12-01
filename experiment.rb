#this script is our experimentation with different variations of the Monty Hall problem

require 'Monty.rb'

three_door_switch = Monty.new({switch:true,num_of_doors:3})
three_door = Monty.new({switch:false,num_of_doors:3})
