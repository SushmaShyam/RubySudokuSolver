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



# The Sudoku Grid consists of SudokuCells each of which 
#would be assigned with a value once the puzzle is solved

require 'set'

class SudokuCell
  attr_reader :value, :row, :column

  def initialize(row, column)
    @row = row
    @column = column
    @cell_lists = []
  end
  def assign(value)        
    @value = value
  end
  
  def empty?
    @value.nil?    
  end
  # Return a set of numbers that could be assigned to the cell without
  # conflicting with any cells in any of the cell's groups.
  def available_values
    if value
      Set[]
    else
      @cell_lists.inject(VALIDSET) do |result, cellList|
        result - cellList.values
      end
    end
  end

  # The cell joins the given group.
  def associate_to_list(cell_list)
    @cell_lists << cell_list
  end
end