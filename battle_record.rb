class BattleRecord
  def initialize(enemy, battle_date, result)
    @enemy = enemy
    @battle_date = battle_date
    @result = result
  end

  def show_battle_stats
    puts "You have fought against #{@enemy.army_name}"
    puts "Your fight was the past #{@battle_date}"
    puts "The result was a #{@result}"
  end
end