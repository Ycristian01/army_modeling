Dir["./units/*.rb"].each { |file| require_relative file }
Dir["./civilizations/*.rb"].each { |file| require_relative file }
Dir["./src/*.rb"].each { |file| require_relative file }
require_relative "./helpers/logs.helper"

# Test single units with their basic stats
def show_units_basic_stats
  pikeman = PikemanUnit.new
  bowman = BowmanUnit.new
  knight = KnightUnit.new

  log_separator("Units Basic Stats")
  pikeman.show_unit_stats
  bowman.show_unit_stats
  knight.show_unit_stats
end

# Test armies
def armies_stats
  chinese_civilization = ChineseCivilization.new
  british_civilization = BritishCivilization.new
  bizantine_civilization = BizantineCivilization.new

  chinese_army = Army.new(chinese_civilization)
  british_army = Army.new(british_civilization)
  bizantine_army = Army.new(bizantine_civilization)


  log_separator("Armies Basic Stats")
  chinese_army.show_army_stats
  british_army.show_army_stats
  bizantine_army.show_army_stats
end

# Test units training
def train_army_units(army)

  log_separator("Units training")
  puts "🪖 ⚔️ 🛡️  #{army.name} total strength before training: #{army.total_strength}"

  pikeman_to_train = army.soldiers.select {|unit| unit.class == PikemanUnit}.first
  bowman_to_train = army.soldiers.select {|unit| unit.class == BowmanUnit}.first
  knight_to_train = army.soldiers.select {|unit| unit.class == KnightUnit}.first

  army.train(pikeman_to_train)
  army.train(bowman_to_train)
  army.train(knight_to_train)

  puts "🪖 ⚔️ 🛡️ ➕  #{army.name} total strength after training: #{army.total_strength}"
  puts "💰 #{army.name} total gold after training: #{army.gold}"
  puts ""

  return army
end

# Test units power-up
def power_up_army_units(army)

  log_separator("Units power-up")
  puts "🪖 ⚔️ 🛡️  #{army.name} total strength before power-up: #{army.total_strength}"

  pikeman_to_power_up = army.soldiers.select {|unit| unit.class == PikemanUnit}.first
  bowman_to_power_up = army.soldiers.select {|unit| unit.class == BowmanUnit}.first
  knight_to_power_up = army.soldiers.select {|unit| unit.class == KnightUnit}.first

  army.power_up_unit(pikeman_to_power_up)
  army.power_up_unit(bowman_to_power_up)
  army.power_up_unit(knight_to_power_up)

  puts "🪖 ⚔️ 🛡️ ➕  #{army.name} total strength after power-up: #{army.total_strength}"
  puts "💰 #{army.name} total gold after power-up: #{army.gold}"
  puts ""

  return army
end

# Test battle
def face_armies(first_army, second_army)
  log_separator("BATTLE STARTS: #{first_army.name} 🆚 #{second_army.name}")
  battle_builder = BattleBuilder.new(first_army, second_army)
  battle_builder.start_fight

  log_separator("#{first_army.name} last battle record:")
  first_army.get_last_battle_stats
  log_separator("#{second_army.name} last battle record:")
  second_army.get_last_battle_stats
end

# Test two differentes armies with no upgrades
def binzantine_vs_british
  british_civilization = BritishCivilization.new
  bizantine_civilization = BizantineCivilization.new

  british_army = Army.new(british_civilization)
  bizantine_army = Army.new(bizantine_civilization)

  face_armies(british_army, bizantine_army)
end

# Test two armies from the same civilization with no upgrades (draw)
def chinese_vs_chinese
  a_chinese_civilization = ChineseCivilization.new
  another_chinese_civilization = ChineseCivilization.new

  a_chinese_army = Army.new(a_chinese_civilization)
  another_chinese_army = Army.new(another_chinese_civilization)

  face_armies(a_chinese_army, another_chinese_army)
end

# Test two differentes armies with upgrades
def chinese_vs_british_with_upgrades
  chinese_civilization = ChineseCivilization.new
  british_civilization = BritishCivilization.new

  chinese_army = Army.new(chinese_civilization)
  british_army = Army.new(british_civilization)

  chinese_army = train_army_units(chinese_army)
  british_army = train_army_units(british_army)

  chinese_army = power_up_army_units(chinese_army)
  british_army = power_up_army_units(british_army)

  face_armies(chinese_army, british_army)
end

# main

chinese_civilization = ChineseCivilization.new
chinese_army_to_level_up = Army.new(chinese_civilization)

puts "*"*50
show_units_basic_stats
puts "*"*50
armies_stats

puts "*"*50
train_army_units(chinese_army_to_level_up)
power_up_army_units(chinese_army_to_level_up)
puts "*"*50

binzantine_vs_british
puts "*"*50
chinese_vs_chinese
puts "*"*50
chinese_vs_british_with_upgrades