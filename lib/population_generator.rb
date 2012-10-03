class PopulationGenerator
  def initialize opts
    @max_x = opts[:max_x]
    @max_y = opts[:max_y]
  end

  def populate_from_seed seed
    Population.new @max_y, @max_x, seed
  end

  def populate old_generation
    
  end
end
