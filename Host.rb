#The crux of the Monty Hall problem lays within the amount of doors the host
#reveals in relation to total number of doors.  This class inherits from Monty
#with an addition num_of_reveals attribute



###We determined that this class was unnecessary 

class Host < Monty

  def initialize(args)
    @num_of_reveals = args[:num_of_reveals]
    super
  end

  def host_test #<----Wrapper method for testing
    hide_prize
  end

  private

  def switch_sim(player_choice_1)
    @doors[player_choice_1] = "player choice"
    @num_of_reveals.times do
      host_reveal
    end
    player_choice_options = @doors.each_index.select{|elem| @doors[elem] != "host reveal" and @doors[elem] != "player choice"}
    player_choice_2 = player_choice_options[rand(player_choice_options.length)]
    @switch_win = @switch_win.succ if chk_win(player_choice_2)
  end
end
