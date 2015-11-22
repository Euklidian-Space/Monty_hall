class Monty
  attr_reader :stay_win, :switch_win
  def initialize(args)
    @num_of_doors = args[:num_of_doors]
    @switch = args[:switch]  #we have an issue here if the args hash is passed with out :switch, it will default to nil(falsey)
    @doors = Array.new(@num_of_doors)
    @switch_win = 0
    @stay_win = 0
  end

  def run_sim
    hide_prize
    player_choice_1 = player_sim
    if @switch
      #do some shit

    else
      @stay_win += 1 if chk_win
    end


  end

  private

  def hide_prize
    @doors[rand(@num_of_doors)] = "Prize"
  end

  def player_sim
    rand(@num_of_doors)
  end

  def chk_win
    @doors[player_sim] == "Prize"
  end

  def host_reveal(player_choice)
    
  end


end
