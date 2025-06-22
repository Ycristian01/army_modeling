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
    new_unit = KnightUnit.new
    puts "🆙 Total strength points earned by power-up bowman to knight: #{new_unit.strength_points - self.strength_points}"
    return new_unit
  end
end