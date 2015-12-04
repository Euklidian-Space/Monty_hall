Welcome to our monty hall project.  In order to use this for your own experiments
require both Monty.rb in your script.

We have made Monty an abstract class with Stay and Switch classes inheriting from it.
If you want to simulate a switch you must instantiate a switch object like so

variable = Switch.new(args)

where args is a hash with keys :num_of_doors num_of_reveals representing the number
of doors the game starts with and the number of doors the game host opens respectively.  If you want the classic Monty hall set up merely omit the args hash.

To run one simulation merely call run_sim on your Switch object.  

To simulate a stay, instantiate a Stay object and repeat the process for the Switch.
