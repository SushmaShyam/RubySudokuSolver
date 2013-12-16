require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :solve, [:puzzle] do |t, args|
  puts args
  fail "Provide puzzle name" if args.puzzle.nil?
  sh "ruby sudoku.rb puzzles/#{args.puzzle}.txt"
end

