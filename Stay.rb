class Stay < Monty

  attr_reader :stay_win

  def post_initialize(args)
    @stay_win = 0
  end

  def local_sim(player_choice)
    @stay_win += 1 if chk_win(player_choice)
  end

  def self.reload
    load 'Stay.rb'
  end

end
