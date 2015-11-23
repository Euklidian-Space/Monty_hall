class Monty
  attr_reader :stay_win, :switch_win
  def initialize(args)
    @num_of_doors = args[:num_of_doors]
    @switch = args[:switch]  #we have an issue here if the args hash is passed with out :switch, it will default to nil(falsey)
    @doors = Array.new(@num_of_doors)
    #might combine the next two instance vars to just one @win_count
    @switch_win = 0
    @stay_win = 0
  end

  def run_sim
    hide_prize
    player_choice_1 = player_sim
    @doors[player_choice_1] = "player choice" if @doors[player_choice_1].nil?
    if @switch
      #do some shit
      host_reveal(player_choice_1)
    else
      @stay_win += 1 if chk_win(player_choice_1)
    end


  end

  private

  def hide_prize
    @doors[rand(@num_of_doors)] = "Prize"
  end

  def player_sim
    rand(@num_of_doors)
  end

  def chk_win(player_choice)
    @doors[player_choice] == "Prize"
  end

  def host_reveal(player_choice)

  end


end
