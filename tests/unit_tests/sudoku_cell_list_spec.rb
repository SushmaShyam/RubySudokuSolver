require_relative '..\..\lib\sudoku_cell'
require_relative '..\..\lib\sudoku_cell_list'

VALIDSET = Set['1','2','3','4','5','6','7','8','9']

describe "SudokuCellList" do 
  before(:all) do
    @cellList = SudokuCellList.new
  end
  context "without cells " do
    it "should allow all values" do
      @cellList.possible_values == VALIDSET
    end
    it "should have no values" do
      @cellList.values == Set[]
    end
  end
  
  context "after addition of cells with some values" do
    before(:each) do
      row = 0
      column = 0
      ['3','6', nil].each do |value|   
        cell = SudokuCell.new(row, column)
        cell.assign value
        row = row+1
        column = column +1
        @cellList << cell
      end  
    end
    it "should return correct possible values" do
      @cellList.possible_values == ['1','2','4','5','7','8','9']
    end
    it "should return no cells for existing value" do
      @cellList.cells_for_value('3')  == []
    end
    
  end
end
