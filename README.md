Overview
================

A sudoku puzzle solver written in ruby. 


## Running tests

Drop your puzzle in the puzzles folder and run the following command to see the solution on the console:-

rake solve[puzzle_name]

Example:- 

rake solve[puzzle_easy]

The sudoku solver will look for puzzle_easy.txt in the puzzles folder and print the solution on the console.

## About this sudoku solver

This sudoku solver uses the strategy design pattern to use multiple techniques and a fallback mechanism to solve a sudoku puzzle.   