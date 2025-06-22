require_relative 'unit'

class KnightUnit < Unit

  def initialize
    super(
      strength_points: 20, 
      training_cost: 30,
      power_up_cost: 0
    )
    @post_training_points = 10
  end

  def power_up
    puts "❌ The knight unit can not be upgraded"
    return self
  end
end