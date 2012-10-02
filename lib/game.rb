require_relative 'renderer'

class Game
  attr_writer :renderer, :population_generator

  def initialize seed
    @seed = seed
  end

  def next_turn!
    next_generation = population_generator.populate current_generation
    renderer.render next_generation
    self.current_generation = next_generation
  end

  private

  attr_writer :current_generation

  def current_generation
    @current_generation ||= population_generator.populate_from_seed(@seed)
  end

  def renderer
    @renderer ||= new Renderer
  end

  def population_generator
    @population_generator ||= new PopulationGenerator
  end

end
