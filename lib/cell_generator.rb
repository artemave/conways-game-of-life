class CellGenerator
  def self.generate cell_with_neighbours_matrix
    target_cell = cell_with_neighbours_matrix[1,1]

    live_neighbours_count = cell_with_neighbours_matrix.each.inject(0) do |cnt, cell|
      cnt += cell.alive? ? 1 : 0
    end

    live_neighbours_count -= 1 if target_cell.alive?

    if (target_cell.alive? && live_neighbours_count == 2) || live_neighbours_count == 3
      Cell.new 'live'
    else
      Cell.new 'dead'
    end
  end
end
