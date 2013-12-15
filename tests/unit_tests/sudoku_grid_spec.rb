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

require_relative '../../lib/sudoku_grid.rb'

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
  
  context "after solving" do
    before(:each) do
      @grid.solve  
    end
    it "should be solved" do    
      @grid.solved? == true
    end
    it "should have correct state" do
      @grid.state == ["3", "2", "5","6", "1", "8","4", "9", "7","7", "1", "6","9", "2", "4","3", "8", "5","9", "8", "4","5", "3", "7","6", "1", "2","5", "6", "9","4", "8", "2","7", "3", "1",
      "1", "4", "2", "3", "7", "5", "8", "6", "9", "8", "3", "7", "1", "6", "9", "2", "5", "4","4", "7", "3", "8", "5", "1", "9", "2", "6","2", "5", "8","7", "9", "6", "1", "4", "3","6", "9", "1", "2", "4", "3","5", "7", "8"]
    end
  end

  after(:all) do
    @file.close
  end
end
