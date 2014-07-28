# The strategy used here is if within any cell list there is a value that can only be assigned to
# single cell, then assign that value to that cell.
#

class CelllistStrategy
  attr_reader :grid
  def initialize(grid)
    @grid = grid
  end
  def solve
    solved = false
    
    grid.cellLists.each do |cellList|
      cellList.empty_cells_map.each do |value, cells|
        if cells.size == 1
          (cells.first).value = value
          solved = true
          break
        end
      end
    end
    
    solved
  end
end