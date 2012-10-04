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
    @current_generation ||= population_generator.generate_from_seed(@seed)
  end

  def renderer
    @renderer ||= Renderer.new screen_driver
  end

  def population_generator
    @population_generator ||= PopulationGenerator.new(
      max_x: screen_driver.max_x,
      max_y: screen_driver.max_y
    )
  end

  def screen_driver
    @screen_driver ||= ScreenDriver.new
  end
end
