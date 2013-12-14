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

require_relative 'sudoku_cell'
require_relative 'sudoku_cell_list'
require_relative 'strategies/backtrack_strategy'
require_relative 'strategies/cell_strategy'
require_relative 'strategies/cellList_strategy'


class SudokuGrid
  attr_reader :cells, :cellLists
  class GridPosition
    attr_accessor :row, :column
  end
  ArgumentError = Class.new(StandardError)
  NoSolutionError = Class.new(StandardError)
  # create grid with data in the file
  def initialize(file)
    @cells = Array.new
    row = 0
    column = 0
    f = File.new(file)
    
    f.each_char do |char|
      
      # ignore tabs, spaces, carriage return and newline chars 
      unless ["\n","\r", "", "\t"].include?(char)
        puts char
        pos = GridPosition.new
        pos.row = row
        pos.column = column
        cell = SudokuCell.new(pos)
        cell.assign(char) if VALIDSET.include?(char)
        @cells << cell
        break if row == 8 && column == 8 
              
        if(column == 8)
          column = 0
          row = row + 1
          puts "next_row"
        else
          column = column + 1
        end             
      else
        puts "space"
      end
    end
    puts @cells.size
    raise ArgumentError.new if @cells.size != 81
    make_cell_lists
    create_strategies
  end

  # is this grid completely solved
  def solved?
    @cells.each do |cell|
      if(cell.empty?)
      return false
      end
    end
    return true
  end

  # is this grid in an unsolvable state
  def unsolvable?
    @cells.any? { |cell| cell.empty? && cell.available_values.size == 0 }
  end

  # make cell lists, each of which should contain unique numbers in a solved grid
  def make_cell_lists
    @cellLists = []
    add_row_cell_lists
    add_column_cell_lists
    add_block_cell_lists
  end

  # returns the cell at the given position
  def cell_at_pos(row,column)
    index = row * 9 +column 
    @cells[index]
  end

  # add cell lists for each row
  def add_row_cell_lists
    [0,1,2,3,4,5,6,7,8].each do |row_index|
      puts row_index
      cellList = SudokuCellList.new
      [0,1,2,3,4,5,6,7,8].each do |column_index|
        cellList << cell_at_pos(row_index,column_index)
      end
      cellLists << cellList
    end
  end

  # add cell lists for each column
  def add_column_cell_lists
    [0,1,2,3,4,5,6,7,8].each do |column_index|
      cellList = SudokuCellList.new
      [0,1,2,3,4,5,6,7,8].each do |row_index|
        cellList << cell_at_pos(row_index,column_index)
      end
      cellLists << cellList
    end
  end

  # add cell lists for each block of 3x3 in the grid 
  def add_block_cell_lists
    [0,1,2,3,4,5,6,7,8].each do |block_index|
      cellList = SudokuCellList.new
      [0,1,2].each do |row_index|
        [0,1,2].each do |column_index|
          row = (block_index+1)/3 + row_index
          column = (block_index+1)%3 + row_index
          cellList << cell_at_pos(row_index,column_index)
        end
      end
      cellLists << cellList
    end
  end
  
  # solve the sudoku grid using the different strategies available
  def solve
    while ! solved?
      unless @strategies.find { |s| s.solve }
        # if the grid gets to a stage where none of the strategies could solve it, there is no solution to it
        fail NoSolutionError
      end
    end
  end
  
  # instantiate the strategy classes available for solving sudoku puzzles
  def create_strategies
    @strategies = []
    @strategies << CellStrategy.new(self)
    @strategies << CellListStrategy.new(self)
    @strategies << BacktrackStrategy.new(self)
  end
  
  # return the current state of the board whih is an array of cell values
  def state
    return cells.collect{|cell| cell.value}
  end
  
  # reassign to the new list of cell values given in the state variable
  def set(state)
    cells.zip(state){|cell, value| cell.assign(value)}
  end
  
  def inspect
    state
  end
end