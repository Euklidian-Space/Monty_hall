Welcome to our monty hall project.  In order to use this for your own experiments
require both Monty.rb and Host.rb into your script. Create a monty object like so

mont = Monty.new(args)

where args is a hash with the following keys,

:switch <----boolean
:num_of_doors <----integer

to run one simulation a user must call .run_sim on your monty object.  To see how many wins
there were call .switch_wins or .stay_wins

Now, if you want to control the number of doors the host reveals you must make a host object

h = Host.new(args)

where args has the same keys as a Monty object with the addition of

:num_of_reveals <----integer

Then merely run .run_sim on your host object like your monty object.  
