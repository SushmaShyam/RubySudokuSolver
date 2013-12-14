
  # Find a cell with only one possibile value and assign it.  Return true if
  # you are able to assign a cell, else return false.
class CellStrategy
  attr_reader :grid
  def initialize(grid)
    @grid = grid
  end

  def solve
    grid.cells.each do |cell|
      values = cell.available_values
      if values.size == 1
        cell.assign(values.to_a.first)
        return true
      end
    end
    return false
  end
end