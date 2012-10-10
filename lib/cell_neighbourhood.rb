class CellNeighbourhood
  def self.extract_from_population population
    array_res = population.each_with_index.map do |_, row, col|
      wrap_in_dead_cells(population).minor 0+row..2+row, 0+col..2+col
    end

    # because Matrix#each_with_index.map does not return Matrix but Array
    # ... obviously
    Matrix[*array_res.each_slice(population.column_size).to_a]
  end

  private
  
  def self.wrap_in_dead_cells population
    columns = population.transpose.to_a
    columns.unshift(Array.new(population.row_size) { false})
    columns.push(Array.new(population.row_size) { false})

    x_wrapped_population = Matrix.columns columns

    rows = x_wrapped_population.to_a
    rows.unshift(Array.new(x_wrapped_population.column_size) { false})
    rows.push(Array.new(x_wrapped_population.column_size) { false})

    Matrix.rows rows
  end
end
