class Switch < Monty

  attr_reader :switch_win
  def post_initialize(args)
    @switch_win = 0
  end

  def local_sim(player_choice)
    #do some shit
    switch_sim(player_choice)

  #    @stay_win = @stay_win.succ if chk_win(player_choice_1)
  end

  def self.reload
    load 'Switch.rb'
  end

  private

  def switch_sim(player_choice)
    if @doors[player_choice].nil?
      @doors[player_choice] = "player choice"
      num_of_reveals.times do
        host_reveal
      end
      player_choice_options = @doors.each_index.select{|elem| @doors[elem] != "host reveal" and @doors[elem] != "player choice"}
      player_choice = player_choice_options[rand(player_choice_options.length)]
      @switch_win += 1 if chk_win(player_choice)
    end
  end

end
