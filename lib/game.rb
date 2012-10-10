require_relative 'renderer'
require_relative 'population_generator'
require_relative 'screen_driver'

class Game
  attr_writer :renderer, :population_generator

  def initialize seed
    @seed = seed
  end

  def init_world
    self.current_generation = population_generator.generate_from_seed(@seed)
    renderer.render current_generation
  end

  def next_turn!
    self.current_generation = population_generator.generate current_generation
    renderer.render current_generation
  end

  private

  attr_accessor :current_generation

  def renderer
    @renderer ||= Renderer.new screen_driver
  end

  def population_generator
    @population_generator ||= PopulationGenerator.new(
      # Full screen is just too damn slow with my ultra performant solution
      #
      # max_x: screen_driver.max_x,
      # max_y: screen_driver.max_y
      max_x: 60,
      max_y: 30
    )
  end

  def screen_driver
    @screen_driver ||= ScreenDriver.new
  end
end
