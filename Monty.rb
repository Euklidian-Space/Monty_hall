class Monty
  attr_reader :sim_count, :num_of_reveals, :num_of_doors
  def initialize(args = {})
    @num_of_doors = args[:num_of_doors] || default_num_of_doors
    @num_of_reveals = args[:num_of_reveals] || default_num_of_reveals
    @doors = Array.new(@num_of_doors)
    @sim_count = 0 #<----This will tell user how many times he/she has ran the simulation
    post_initialize(args)
  end

  def run_sim
    @sim_count += 1
    hide_prize
    player_choice_1 = rand(@num_of_doors)
    local_sim(player_choice_1)
    @doors = Array.new(@num_of_doors)
    "Reseting doors array...check self for results"
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

  def chk_win(player_choice)
    @doors[player_choice] == "Prize"
  end

  def host_reveal
    host_options = @doors.each_index.select{|elem| @doors[elem].nil?}
    host_choice = host_options[rand(host_options.length)]
    @doors[host_choice] = "host reveal"
  end

  def local_sim(args)
    raise NotImplementedError,
      "This #{self.class} object cannot respond to: local_sim"
  end

  def post_initialize(args)
    nil
  end

end
