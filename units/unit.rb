class Unit
  attr_reader :strength_points, :train_cost, :power_up_cost

  def initialize(strength_points:, train_cost:, power_up_cost:)
    @strength_points = strength_points
    @train_cost = train_cost
    @power_up_cost = power_up_cost
  end

  def train
    @strength_points += @post_train_points
  end

  def power_up
  end
end