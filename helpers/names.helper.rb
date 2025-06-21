def formatted_army_name(civilization_name)
  civilization_name
    .gsub(/Civilization$/, '')
    .downcase + ' army'
end

def formatted_unit_name(unit_class_name)
  base_name = unit_class_name.gsub(/Unit$/, '').downcase
  base_name == "knight" ? "knight" : "#{base_name} soldier"
end