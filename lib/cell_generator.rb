class CellGenerator
  def self.generate cell_with_neighbours_matrix
    live_cell_count = cell_with_neighbours_matrix.each.inject(0) do |cnt, cell|
      cnt += cell ? 1 : 0
    end

    if live_cell_count >= 3 && live_cell_count <= 4
      true
    else
      false
    end
  end
end
