require_relative 'unit'

class BowmanUnit < Unit

  def initialize
    super(
      strength_points: 10, 
      training_cost: 20,
      power_up_cost: 40
    )
    @post_training_points = 7
  end

  def power_up
    return KnightUnit.new
  end
end