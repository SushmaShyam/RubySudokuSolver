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

# this module is used to create the strategy classes available for solving sudoku puzzles
# it iterates through the strategies folder to find all strategy classes available and instantiates it
require 'find'

module StrategyFactory
  def self.get_strategies_from_dir
    begin
      classes = []      
      
      Find.find(File.dirname(__FILE__) + "/strategies/") do |item|              
        if !File.directory?(item)         
          require item
          classes << class_name(item)
        end
      end

    rescue => e 
      puts e.message
    end
    return classes
  end
  
  def self.class_name(file_name)
    #convert from snake case to pascal case
     snake_case_string = File.basename(file_name, ".*")
     return snake_case_string.split("_").map{|w| w.capitalize }.join("")
  end
  
  def self.create_strategies(grid)
    strategies = []
    strategy_classes = get_strategies_from_dir
    strategy_classes.each do |strategy_class|
      class_obj = Kernel.const_get(strategy_class)
      strategies << class_obj.new(grid)
    end
    strategies
  end
  
end

      
