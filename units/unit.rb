require_relative "../helpers/names.helper"

class Unit
  attr_reader :strength_points, :training_cost, :power_up_cost

  def initialize(strength_points:, training_cost:, power_up_cost:)
    @strength_points = strength_points
    @training_cost = training_cost
    @power_up_cost = power_up_cost
  end

  def train
    puts "🏋️  Total strength points earned by training #{formatted_unit_name(self.class.name)}: #{@post_training_points}"
    @strength_points += @post_training_points
  end

  def power_up
  end

  def show_unit_stats
    puts "🪖  Unit type: #{formatted_unit_name(self.class.name)}"
    puts "⚔️  Strength points: #{@strength_points}"
    puts "💰 Training cost: #{@training_cost} gold"
    puts "⚡ Power-Up cost: #{@power_up_cost} gold"
    puts ""
  end
end