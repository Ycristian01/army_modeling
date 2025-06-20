require_relative 'unit'

class PikemanUnit < Unit

  def initialize
    super(
      strength_points: 5, 
      training_cost: 10,
      power_up_cost: 30
    )
    @post_training_points = 3
  end

  def power_up
    return BowmanUnit.new
  end
end