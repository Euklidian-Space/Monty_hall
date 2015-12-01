#The crux of the Monty Hall problem lays within the amount of doors the host
#reveals in relation to total number of doors.  This class inherits from Monty
#with an addition num_of_reveals attribute

class Host < Monty

  def initialize(args)
    @num_of_reveals = args[:num_of_reveals]
    super
  end

  def host_test
    hide_prize
  end


end
