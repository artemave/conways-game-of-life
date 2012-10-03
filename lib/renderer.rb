class Renderer
  def initialize screen_driver
    @screen_driver = screen_driver
  end

  def render generation
    generation.each_with_index do |cell, row, col|
      @screen_driver.draw_char(row, col, '+') if cell.alive?
    end
  end
end
