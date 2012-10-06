class PopulationGenerator
  def initialize opts
    @max_x = opts[:max_x]
    @max_y = opts[:max_y]
  end

  def generate_from_seed seed
    Population.new @max_y, @max_x, seed
  end

  def generate old_generation
    neighbourhood = CellNeighbourhood.extract_from_population old_generation

    new_generation = neighbourhood.map do |cell_with_neighbours_matrix|
      CellGenerator.generate cell_with_neighbours_matrix
    end
  end
end
