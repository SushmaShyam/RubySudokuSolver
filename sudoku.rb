require_relative 'lib/sudoku_solver'

solver = SudokuSolver.new
puts ARGV[0]
solver.solve(ARGV[0])

