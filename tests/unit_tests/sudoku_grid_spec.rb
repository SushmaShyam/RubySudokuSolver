require_relative '../../lib/sudoku_grid.rb'
require 'rspec/given'
VALIDSET = Set['1','2','3','4','5','6','7','8','9']
describe 'SudokuGrid' do
  before(:all) do
    @file = File.new("puzzles/puzzle_easy.txt")
    @grid = SudokuGrid.new(@file) 
  end

  it "should have 81 cells" do
    @grid.cells.count == 81
  end
  
  it "should have 9 cell lists" do
    @grid.cellLists.count == 9
  end
    
  it "should return unsolved" do
    @grid.solved? == false
  end
  
  it "should not return unsolvable" do
    @grid.unsolvable? == false
  end
  
  it "should be solved" do
    @grid.solve
    @grid.solved? == true
  end
  after(:all) do
    @file.close
  end
end
