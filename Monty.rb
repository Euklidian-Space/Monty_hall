###This class runs one iteration of the monty hall simulation
###everytime run_sim is called on an instance of Monty.
###The amount of simulations will be determined by the scientist
###who decides to utilize this class in his/her own script
class Monty
  attr_reader :stay_win, :switch_win, :sim_count
  def initialize(args)
    @num_of_doors = args[:num_of_doors]
    @switch = args[:switch]  #we have an issue here, if the args hash is passed with out :switch, it will default to nil(falsey)
    @doors = Array.new(@num_of_doors)
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

    else
      @stay_win = @stay_win.succ if chk_win(player_choice_1)
    end
    @doors = Array.new(@num_of_doors)
    "Reseting doors array...check self for results"
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


  def switch_sim(player_choice_1) #<---This should ONLY be called within run_sim.  Considering to make it a block instead
    if @doors[player_choice_1].nil?
      @doors[player_choice_1] = "player choice"
      #p @doors
      host_reveal
      #print "host reveals "
      #p @doors
      player_choice_options = @doors.each_index.select{|elem| @doors[elem] != "host reveal" and @doors[elem] != "player choice"}
      #print "player can choose the following doors: "
      #p player_choice_options
      player_choice_2 = player_choice_options[rand(player_choice_options.length)]
      #print "player chose: "
      #p player_choice_2
      #p @doors
      #print "did player win?: "
      #p chk_win(player_choice_2)
      @switch_win = @switch_win.succ if chk_win(player_choice_2)

    end
  end

  def chk_win(player_choice)
    @doors[player_choice] == "Prize"
  end

  def host_reveal
    #This method needed to be changed slightly to reflect a more random nature.  It wasn't
    #neccesssary in the case of 3 doors since pigeon hole principle was in affect.
    host_options = @doors.each_index.select{|elem| @doors[elem].nil?}
    host_choice = host_options[rand(host_options.length)]
    @doors[host_choice] = "host reveal"
  end

end
