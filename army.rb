require_relative "./helpers/army_name.helper"

class Army
  attr_accessor :gold
  attr_reader :army_name

  def initialize(civilization)
    @gold = 1000
    @battle_record = []
    @civilization = civilization
    @army_name = formatted_army_name(civilization.class.name)
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
      upgraded_unit = unit.power_up
      if (upgraded_unit != unit)
        @gold -= unit.power_up_cost
        soldiers.delete(unit)
        soldiers << upgraded_unit
      end
    end
  end

  def add_battle_record(new_battle_record)
    @battle_record << new_battle_record
  end

  def get_last_battle_stats
    if(@battle_record.length > 0)
      @battle_record.last.show_battle_stats
    else
      print "This army has no battles yet"
    end
  end
end