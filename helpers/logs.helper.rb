def log_separator(title = "")
  width = 50
  puts ""
  if title.empty?
    puts "-" * width
  else
    padding = (width - title.length - 2) / 2
    puts "-" * padding + " #{title} " + "-" * padding
  end
end