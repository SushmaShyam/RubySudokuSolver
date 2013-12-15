=begin
+The MIT License (MIT)
+
+Copyright (c) 2013 SushmaShyam
+
+Permission is hereby granted, free of charge, to any person obtaining a copy of
+this software and associated documentation files (the "Software"), to deal in
+the Software without restriction, including without limitation the rights to
+use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
+the Software, and to permit persons to whom the Software is furnished to do so,
+subject to the following conditions:
+  
=end
require_relative 'sudoku_grid'
VALIDSET = Set['1','2','3','4','5','6','7','8','9']

class SudokuSolver  

  def new_grid(file)
    grid = SudokuGrid.new(file)
    grid
  end

  def solve(file)
    grid = new_grid(file)        
    begin
      puts "Problem:"
      grid.print_to_screen
      grid.solve
      puts "Solution:"
      grid.print_to_screen
    rescue SudokuGrid::NoSolutionError => ex
      puts ex.message
    end
  end
  
end

