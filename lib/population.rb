require 'matrix'

class Population
  def initialize row_size = 0, column_size = 0, seed = []
    @grid = Matrix.build row_size, column_size do |row, col|
      seed.any? do |(r,c,cell)|
        r == row && c == col && cell
      end ? true : false
    end
  end

  def method_missing method, *args, &block
    @grid.send(method, *args, &block)
  end
end
