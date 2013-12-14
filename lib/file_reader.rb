f = File.new("puzzle1.txt")
f.each_char do |char|
  puts ["\n"].include?(char)
end
