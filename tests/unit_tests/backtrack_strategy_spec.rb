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
describe "BacktrackStrategy" do
  context "valid puzzle" do
    before(:each) do
      
      @file = File.new("puzzles/puzzle_easy.txt")
      @grid = SudokuGrid.new(@file)
      @strategy = BacktrackStrategy.new(@grid) 
    end
    it "should solve a valid puzzle" do
       @strategy.solve == true
    end
  end
    
  context "invalid puzzle" do
    before(:each) do
      
      @file = File.new("puzzles/puzzle_invalid.txt")
      @grid = SudokuGrid.new(@file)
      @strategy = BacktrackStrategy.new(@grid) 
    end
    it "should not solve an invalid puzzle" do
       @strategy.solve == false
    end
  end
  
end

