Dir["./units/*.rb"].each { |file| require_relative file }
Dir["./civilizations/*.rb"].each { |file| require_relative file }
require_relative "army"

# test single units

pikeman = PikemanUnit.new
bowman = BowmanUnit.new
knight = KnightUnit.new

puts "pikeman stats: #{pikeman.inspect}"
puts "bowman stats: #{bowman.inspect}"
puts "knight stats: #{knight.inspect}"

# test single civilizations

chinese_civilization = ChineseCivilization.new
british_civilization = BritishCivilization.new
bizantine_civilization = BizantineCivilization.new

# test armies creation

chinese_army = Army.new(chinese_civilization)

puts "chinese army total soldiers: #{chinese_army.soldiers.length}"

# test units training

puts "chinese army total strength before training: #{chinese_army.total_strength}" 

pikeman_to_train = chinese_army.soldiers.select {|unit| unit.class == PikemanUnit}.first
bowman_to_train = chinese_army.soldiers.select {|unit| unit.class == BowmanUnit}.first
knight_to_train = chinese_army.soldiers.select {|unit| unit.class == KnightUnit}.first

chinese_army.train(pikeman_to_train)
chinese_army.train(bowman_to_train)
chinese_army.train(knight_to_train)

puts "chinese army total strength after training: #{chinese_army.total_strength}"

# test units power_up

pikeman_to_power_up = chinese_army.soldiers.select {|unit| unit.class == PikemanUnit}.first
bowman_to_power_up = chinese_army.soldiers.select {|unit| unit.class == BowmanUnit}.first
knight_to_power_up = chinese_army.soldiers.select {|unit| unit.class == KnightUnit}.first

chinese_army.power_up_unit(pikeman_to_power_up)
chinese_army.power_up_unit(bowman_to_power_up)
chinese_army.power_up_unit(knight_to_power_up)

puts "chinese army total strength after power up units: #{chinese_army.total_strength}"