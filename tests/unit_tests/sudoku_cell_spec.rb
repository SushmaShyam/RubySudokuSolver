require_relative '..\..\lib\sudoku_cell'
require_relative '..\..\lib\sudoku_cell_list'

VALIDSET = Set['1','2','3','4','5','6','7','8','9']

describe "SudokuCell" do
  def createCellListWith(cell, *values)
    cl = SudokuCellList.new
    cl << cell
    row = 0
    column = 0
    values.each do |value|      
      c = SudokuCell.new(row,column)
      c.assign value
      cl << c
      row = row + 1
      column = column + 1
    end
    cl
  end
    
  before(:all) do    
    @cell = SudokuCell.new(1,3) 
  end
  
  it "returns the correct row" do    
    @cell.row == 1
  end 
  it "returns the correct column" do    
    @cell.column == 3
  end 
  
  context "when unassigned" do
    it "is empty" do
      @cell.empty? == true
    end
  
    it "should allow all valid numbers" do    
      @cell.available_values == VALIDSET 
    end    
  end
  
  context "when part of cell list" do
    before(:each) do
      createCellListWith(@cell,'1', '2','3', '4','5')
      @cell.available_values
    end
    it "should return correct available values set" do
      @cell.available_values == Set['6','7','8','9']
    end  
   end
   
  context "when assigned" do
    before(:each) do
      @cell.assign '3'
    end
    it "should return empty available values set" do      
      @cell.available_values == Set[]
    end  
    it "should return the correct return value" do
      @cell.value == '3'
    end
   end
end