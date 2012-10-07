class CellGenerator
  def self.generate cell_with_neighbours_matrix
    live_cell_count = cell_with_neighbours_matrix.each.inject(0) do |cnt, cell|
      cnt += cell.alive? ? 1 : 0
    end

    if live_cell_count >= 3 && live_cell_count <= 4
      Cell.new 'live'
    else
      Cell.new 'dead'
    end
  end
end
