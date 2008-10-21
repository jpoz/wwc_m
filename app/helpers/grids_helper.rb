module Merb
  module GridsHelper
    
    def grid_table(array, columns)
      @grid = Grid_helper.new(columns)
      @grid.insert(array)
      output = "<table class='grid'><tr>"
      @grid.grid.each_with_index do |item, index|
        #puts item.inspect
        output += "<td colspan='#{item.width}' rowspan='#{item.height}'>" +
                    item.to_html +
                  "</td>" unless item == (-1) || item == 0
        output += "<td></td>" if item == 0
        output += "</tr><tr>" if ((index+1) % columns) == 0
      end

      output += "</tr></table>"
      #output += @grid.show_grid
      puts output 
    end
    
    class Grid_helper

      def initialize(columns)
        @columns = columns
        @grid = []
      end

      def [](row, col)
        return (-1) if col >= @columns
        @grid[row*@columns + col] ? @grid[row*@columns + col] : @grid[row*@columns + col]=0
      end

      def []=(row, col, newvalue)
        raise "Can't set a box outside of the grid" if col >= @columns
        @grid[row*@columns + col] = newvalue
      end

      def insert(array)
        array.each do |item|
          raise "#{item} does not have a size" if item.width.nil? || item.height.nil?
          raise "#{item} is too large!!" if item.width > @columns
          y, x = free_space_for(item.height, item.width)
          item.height.times do |row|
            item.width.times do |col|
              self[y + row, x + col] = (-1)
            end
          end
          self[y,x] = item
        end
      end

      def free_space_for(height, width)
        raise "#{item} is too large!!" if width > @columns
        result = false
        x, y = -1, 0
        while result == false
          x += 1
          y, x = y+1, 0 if x >= @columns
          hopefulls = []

          height.times do |row|
            width.times do |col|
              hopefulls << self[(y + row), (x + col)]
            end
          end

          return y, x if hopefulls.all? { |hopefull| hopefull == 0 }
        end
      end

      def grid
        @grid
      end

      def show_grid
        output = ""
        @grid.each_with_index do |item, index|
          output += "#{item},"
          output += "<br>" if ((index+1) % @columns) == 0
        end
        output
      end

    end
    
  end
end # Merb