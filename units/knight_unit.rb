require_relative 'unit'

class KnightUnit < Unit

  def initialize
    super(
      strength_points: 20, 
      train_cost: 30,
      power_up_cost: 0
    )
    @post_train_points = 10
  end

  def power_up
    return self
  end
end