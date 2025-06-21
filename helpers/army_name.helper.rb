def formatted_army_name(civilization_name)
  civilization_name
    .gsub(/Civilization$/, '')
    .downcase + ' army'
end