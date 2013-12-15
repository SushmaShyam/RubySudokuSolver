require_relative 'lib/sudoku_solver'

solver = SudokuSolver.new
solver.solve(ARGV[0])

