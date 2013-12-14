class BacktrackStrategy
  attr_reader :grid
  def initialize(grid)
    @grid = grid
    @alternatives = []
    @max_alternatives = 0
  end
  def solve
    if ! grid.unsolvable?
      cell = find_candidate_for_guessing
      remember_alternatives(cell)
      guess
    elsif @alternatives.empty?
      return false
    else      
      @backtrack += 1
      guess
    end
      return true
  end
  private
  
  # Find a candidate cell for guessing.  The candidate must be an
  # unassigned cell.  Prefer cells with the fewest number of available
  # values in order to minimize backtracks
  def find_candidate_for_guessing
    unassigned_cells.sort_by { |cell|
      [cell.available_values.size, to_s]
    }.first
  end

  # Return a list of unassigned cells on the board
  def unassigned_cells
    grid.cells.to_a.reject { |cell| cell.value }
  end

  # Remember all alternative choices for the given cell on the
  # list of alternatives.  An alternative is stored as a 3-tuple
  # consisting of the current encoded state of the grid, the cell and
  # an available value.
  def remember_alternatives(cell)
    cell.available_values.each do |value|
      @alternatives.push([grid.state, cell, value])
    end
    @max_alternatives = [@max_alternatives, @alternatives.size].max
  end

  # Make a guess by pulling an alternative from the list of remembered
  # alternatives and.  The state of the board at the remembered
  # alternative is restored and the choice is made for that cell.
  def guess
    state, cell, value = @alternatives.pop
    grid.set(state)
    cell.assign(value)    
    true
  end
end