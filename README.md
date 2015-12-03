Welcome to our monty hall project.  In order to use this for your own experiments
require both Monty.rb in your script. Create a monty object like so

mont = Monty.new(args)

where args is a hash with the following keys,

:switch <----boolean

:num_of_doors <----integer

:num_of_reveals <----integer

If you want a classical Monty Hall set up merely instantiate a Monty object without
passing any argument at all (i.e,  mont = Monty.new)


to run one simulation a user must call .run_sim on your monty object.  To see how many wins
there were call .switch_win or .stay_win

***NOTE***
Depending on the boolean value of switch only one of @switch_win or @stay_win will be
updated. We made this decision to keep them separate for the purpose of controlled
experiments.  
