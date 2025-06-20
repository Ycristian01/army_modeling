Dir["./units/*.rb"].each { |file| require_relative file }

pikeman = PikemanUnit.new
bowman = BowmanUnit.new
knightman = KnightUnit.new

puts "pikeman stats: #{pikeman.inspect}"
puts "bowman stats: #{bowman.inspect}"
puts "knightman stats: #{knightman.inspect}"

