# The strategy used here is if within any cell list there is a value that can only be assigned to
# single cell, then assign that value to that cell.
#

class CelllistStrategy
  attr_reader :grid
  def initialize(grid)
    @grid = grid
  end
  def solve
    grid.cellLists.each do |cellList|
      cellList.empty_cells_map.each do |value, cells|
        if cells.size == 1
          (cells.first).assign value
        return true
        end
      end
    end
    return false
  end
end