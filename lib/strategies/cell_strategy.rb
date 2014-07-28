
  # Find a cell with only one possibile value and assign it.  Return true if
  # you are able to assign a cell, else return false.
class CellStrategy
  attr_reader :grid
  def initialize(grid)
    @grid = grid
  end

  def solve
    solved = false
    grid.cells.each do |cell|
      values = cell.available_values
      if values.size == 1
        cell.value = (values.to_a.first)
        solved = true
        break
      end
    end
    solved
  end
end