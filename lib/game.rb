require_relative 'renderer'

class Game
  attr_writer :renderer, :generation_populator

  def initialize seed
    @current_generation = seed
  end

  def renderer
    @renderer ||= new Renderer
  end

  def generation_populator
    @generation_populator ||= new GenerationPopulator
  end

  def next_turn!
    next_generation = generation_populator.populate @current_generation
    renderer.render next_generation
    @current_generation = next_generation
  end
end
