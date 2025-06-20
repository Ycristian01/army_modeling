

class Army
  attr_accessor :gold

  def initialize(civilization)
    @gold = 1000
    @civilization = civilization
  end

  def soldiers
    return @civilization.soldiers
  end

  def total_strength
    return @civilization.total_strength
  end

  def train(unit)
    if (@gold >= unit.training_cost)
      @gold -= unit.training_cost
      unit.train
    end
  end

  def power_up_unit(unit)
    if (@gold >= unit.power_up_cost)
      @gold -= unit.power_up_cost
      upgraded_unit = unit.power_up
      if (upgraded_unit != unit)
        soldiers.delete(unit)
        soldiers << upgraded_unit
      end
    end
  end
end