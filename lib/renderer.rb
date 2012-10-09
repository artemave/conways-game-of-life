class Renderer
  def initialize screen_driver
    @screen_driver = screen_driver
  end

  def render generation
    @screen_driver.clear_screen

    generation.each_with_index do |cell, row, col|
      @screen_driver.draw_char(row, col, '+') if cell.alive?
    end
  end
end
