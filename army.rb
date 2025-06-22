require_relative "./helpers/names.helper"

class Army
  attr_accessor :gold
  attr_reader :name

  def initialize(civilization)
    @gold = 1000
    @battle_record = []
    @civilization = civilization
    @name = formatted_army_name(civilization.class.name)
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

  def punish
    sorted_soldiers = soldiers.sort_by{|soldier| -soldier.strength_points}
    pre_total_strength = @civilization.total_strength
    @civilization.soldiers = sorted_soldiers.drop(2)
    puts "💀 The #{@name} lost a total of #{pre_total_strength - @civilization.total_strength} strength points. Now has #{@civilization.total_strength} strength points"
  end

  def reward
    @gold += 100
    puts "💰 The #{@name} now has #{@gold} of gold"
  end
  

  def remove_random_soldier
    random_soldier = soldiers.sample
    soldiers.delete(random_soldier)
    puts "🔀 The #{@name} lost a #{formatted_unit_name(random_soldier.class.name)} with #{random_soldier.strength_points} strength points"
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

  def show_army_stats
    puts "🏰 #{@name}"
    puts "🔹 Pikemen: #{get_total_soldiers(PikemanUnit)}"
    puts "🏹 Bowmen: #{get_total_soldiers(BowmanUnit)}"
    puts "🐎 Knights: #{get_total_soldiers(KnightUnit)}"
    puts "💰 Available gold: #{gold}"
    puts "🪖 ⚔️ 🛡️  Total strength points: #{total_strength}"
    puts ""
  end

  private

  def get_total_soldiers(unit_type)
    self.soldiers.count {|unit| unit.class == unit_type}
  end
end