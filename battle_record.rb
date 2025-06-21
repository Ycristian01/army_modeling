class BattleRecord
  def initialize(enemy, battle_date, result)
    @enemy = enemy
    @battle_date = battle_date
    @result = result
  end

  def show_battle_stats
    puts "The fight was against #{@enemy.army_name}"
    puts "The fight was the past #{@battle_date}"
    puts "The result was a #{@result}"
  end
end