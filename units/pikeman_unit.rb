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
    new_unit = BowmanUnit.new
    puts "🆙 Total strength points earned by power-up pikeman to bowman: #{new_unit.strength_points - self.strength_points}"
    return new_unit
  end
end