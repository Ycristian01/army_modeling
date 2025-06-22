class BattleRecord
  RESULTS = {
    win:   "🥇",
    loose: "🥈",
    draw:  "🤝"
  }.freeze

  def initialize(enemy, battle_date, result)
    @enemy = enemy
    @battle_date = battle_date
    @result = result
  end

  def show_battle_stats
    puts "⚔️ The fight was against #{@enemy.name}"
    puts "📆 The fight was the past #{@battle_date}"
    puts "The result was a #{@result} #{RESULTS[@result.to_sym]}"
  end
end