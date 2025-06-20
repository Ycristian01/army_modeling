Dir["../units/*.rb"].each { |file| require_relative file }

class Civilization
  attr_accessor :soldiers

  def initialize(pikemen_amount:, bowmen_amount:, knights_amount:)
    @soldiers = []
    add_soldiers_to_army(pikemen_amount, PikemanUnit)
    add_soldiers_to_army(bowmen_amount, BowmanUnit)
    add_soldiers_to_army(knights_amount, KnightUnit)
  end

  def add_soldiers_to_army(amount, unit_type)
    if amount > 0
      for i in 1..amount
        @soldiers << unit_type.new
      end
    end
  end

  def total_strength
    total_strength = 0
    for i in 0..(@soldiers.length-1)
        total_strength += @soldiers[i].strength_points
    end
    return total_strength
  end
end