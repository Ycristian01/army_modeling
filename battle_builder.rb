require_relative "army"
require_relative "battle_record"
require 'date'

class BattleBuilder
  def initialize(first_army, second_army)
    @first_army = first_army
    @second_army = second_army
  end

  def start_fight
    if (@first_army.total_strength > @second_army.total_strength)
      puts "THE FIRST ARMY (#{@first_army.army_name}) WINS"
      save_battle_results("win", "loose")
      post_battle_actions(@first_army, @second_army)
    elsif (@second_army.total_strength > @first_army.total_strength)
      puts "THE SECOND ARMY (#{@second_army.army_name}) WINS"
      save_battle_results("loose", "win")
      post_battle_actions(@second_army, @first_army)
    else
      puts "THE BATTLE WAS A DRAW"
      save_battle_results
      draw
    end
  end

  private

  def post_battle_actions(winner_army, looser_army)
    winner_army.reward
    looser_army.punish
  end

  def draw
    @first_army.remove_random_soldier
    @second_army.remove_random_soldier
  end

  def save_battle_results(first_army_result="draw", second_army_result="draw")
    battle_time = Time.now.strftime("%d/%m/%Y")
    @first_army.add_battle_record(BattleRecord.new(@second_army, battle_time, first_army_result))
    @second_army.add_battle_record(BattleRecord.new(@first_army, battle_time, second_army_result))
  end
end