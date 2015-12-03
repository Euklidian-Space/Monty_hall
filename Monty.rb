###This class runs one iteration of the monty hall simulation
###everytime run_sim is called on an instance of Monty.
###The amount of simulations will be determined by the scientist
###who decides to utilize this class in his/her own script
class Monty
  attr_reader :stay_win, :switch_win, :sim_count
  def initialize(args = {})
    @num_of_doors = args[:num_of_doors] || default_num_of_doors
    @switch = args.fetch(:switch, default_switch)
    @num_of_reveals = args[:num_of_reveals] || default_num_of_reveals
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
      switch_sim(player_choice_1)
    else
      @stay_win = @stay_win.succ if chk_win(player_choice_1)
    end
    @doors = Array.new(@num_of_doors)
    "Reseting doors array...check self for results"
  end

  def default_switch
    true
  end

  def default_num_of_doors
    3
  end

  def default_num_of_reveals
    default_num_of_doors - 2 #<---- We chose this as default since this is the borderline case Ordo Naturalis was interested in
  end

  def self.reload
    load 'Monty.rb'
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
      @num_of_reveals.times do
        host_reveal
      end
      player_choice_options = @doors.each_index.select{|elem| @doors[elem] != "host reveal" and @doors[elem] != "player choice"}
      player_choice_2 = player_choice_options[rand(player_choice_options.length)]
      @switch_win = @switch_win.succ if chk_win(player_choice_2)
    end
  end

  def chk_win(player_choice)
    @doors[player_choice] == "Prize"
  end

  def host_reveal
    host_options = @doors.each_index.select{|elem| @doors[elem].nil?}
    host_choice = host_options[rand(host_options.length)]
    @doors[host_choice] = "host reveal"
  end

end
