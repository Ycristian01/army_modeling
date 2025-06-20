class Unit
  attr_reader :strength_points, :training_cost, :power_up_cost

  def initialize(strength_points:, training_cost:, power_up_cost:)
    @strength_points = strength_points
    @training_cost = training_cost
    @power_up_cost = power_up_cost
  end

  def train
    @strength_points += @post_training_points
  end

  def power_up
  end
end