###This class runs one iteration of the monty simulation
###everytime run_sim is called on an instance of Monty.
###We decided to leave the amount of simulations run up to
###the indiviual scientist's descretion.

class Monty
  attr_reader :stay_win, :switch_win, :sim_count
  def initialize(args)
    @num_of_doors = args[:num_of_doors]
    @switch = args[:switch]  #we have an issue here if the args hash is passed with out :switch, it will default to nil(falsey)
    @doors = Array.new(@num_of_doors)
    #might combine the next two instance vars to just one @win_count
    #since each monty object is initialezed as a switch or not a switch
    @switch_win = 0
    @stay_win = 0
    @sim_count = 0 #<----This will tell user how many times he/she has ran the simulation
  end

  def run_sim
    @sim_count = @sim_count.succ
    hide_prize
    player_choice_1 = player_sim
    if @switch
      #do some shit
      switch_sim.call 
    else
      @stay_win = @stay_win.succ if chk_win(player_choice_1)
    end
    @doors = Array.new(@num_of_doors)
  end



  def self.reload #<---this is for testing purposes in irb.  Should be removed after final iteration
    load 'Monty.rb'
  end

  def testing #<---- This is a wrapper function for testing purposes.  Will be removed after final iteration

  end

  private

  def hide_prize
    @doors[rand(@num_of_doors)] = "Prize"
  end

  def player_sim #<---This method isn't really necessary.  Consider removing it.
    rand(@num_of_doors)
  end

  switch_sim = lambda { #<---This should ONLY be called within run_sim.  Considering to make it a block instead
    if @doors[player_choice_1].nil?
      @doors[player_choice_1] = "player choice"
      host_reveal
      player_choice_options = @doors.each_index.select{|elem| @doors[elem] != "host reveal" and @doors[elem] != "player choice"}

      player_choice_2 = player_choice_options[rand(player_choice_options.length)]

      @switch_win = @switch_win.succ if chk_win(player_choice_2)

    end
  }

  def stay_sim
    if chk_win(player_choice_1)
      @stay_win = @stay_win.succ

    end
  end

  def chk_win(player_choice)
    @doors[player_choice] == "Prize"
  end

  def host_reveal
    #this code seeks out the first available nil element.  Eventhough this selection is
    #based off of random results, when abstracted from the problem it is not random.
    #It does not seem this would effect our results, but may warrant future exploration
    #deffinitiely justification for keeping this mehtod private.
    @doors[@doors.index{|elem| elem.nil?}] = "host reveal"
  end


end
