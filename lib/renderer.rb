class Renderer
  def render generation
    generation.each do |(x,y,cell)|
      screen_driver.draw(x, y, '+') if cell.alive?
    end
  end
end
