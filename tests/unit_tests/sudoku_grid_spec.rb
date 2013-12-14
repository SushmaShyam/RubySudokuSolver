require_relative '../lib/sudoku_grid.rb'

describe 'SudokuGrid' do
  before(:all) do
    file = File.read("puzzle.txt")
    grid = SudokuGrid.new(file) 
  end
  
  it "should return unsolved" do
    grid.solved? == false
  end
  
  it "should not return stuck" do
    grid.stuck? == false
  end

end
