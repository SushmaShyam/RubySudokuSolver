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



# Cells are associated with lists. These lists contain a group of cells which need to have unique values


class SudokuCellList
  def initialize
    @cells = []
  end
  # add a cell to the list and associate this list with the cell  
  def << (cell)
    cell.associate_to_list(self)
    @cells << cell
    self
  end

  # return a set of values in this group 
  def values
    Set[*@cells.collect { |cell| cell.value }]
  end


  # return a set of possible values open in this group  
  def possible_values
    Set['1','2','3','4','5','6','7','8','9'] - values
  end
  
  # Set of empty cells that could possibly hold the given value
  def cells_for_value(value)
    Set[*@cells.select { |cell| cell.available_values.include?(value) }]
  end
  
   # Map of all unused values to the list of candidate empty cells.
  def empty_cells_map
    possible_values.inject({}) { |h, n| h.merge(n => cells_for_value(n)) }
  end
  
end
