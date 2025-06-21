require_relative "army"
require_relative "battle_record"
require 'date'

class BattleBuilder
  def initialize(your_army, enemy_army)
    @your_army = your_army
    @enemy_army = enemy_army
  end

  def start_fight
    if (@your_army.total_strength > @enemy_army.total_strength)
      puts "your army wins"
      save_battle_results("win", "loose")
    elsif (@enemy_army.total_strength > @your_army.total_strength)
      puts "your army loses"
      save_battle_results("loose", "win")
    else
      puts "draw"
      save_battle_results
    end
  end

  def save_battle_results(your_result="draw", enemy_result="draw")
    battle_time = Time.now.strftime("%d/%m/%Y")
    @your_army.add_battle_record(BattleRecord.new(@enemy_army, battle_time, your_result))
    @enemy_army.add_battle_record(BattleRecord.new(@your_army, battle_time, enemy_result))
  end
end