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
require_relative 'spec_helper'
require_relative '..\lib\strategies'

describe "StrategyFactory" do
  it "returns strategy classes" do
    StrategyFactory.get_strategies_from_dir == ["BacktrackStrategy","CelllistStrategy","CellStrategy"]
  end
  it "returns instantiated strategy classes" do
    StrategyFactory.get_strategies_from_dir.length == 3
  end
  it "converts file name to class" do
    StrategyFactory.class_name("sudoku_solver.rb") == "SudokuSolver"
  end
end
