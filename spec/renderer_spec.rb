require_relative 'spec_helper'

describe Renderer do
  let(:live_population) { Population.new 3, 4, [[0,1,true], [1,3,true]]}
  let(:dead_population) { Population.new 2, 2, [] }
  let(:renderer) { Renderer.new screen_driver }
  let(:screen_driver) { fire_double 'ScreenDriver' }
  
  it "draws live cells" do
    screen_driver.should_receive(:clear_screen).ordered

    screen_driver.should_receive(:draw_char).with(0, 1, '+').ordered
    screen_driver.should_receive(:draw_char).with(1, 3, '+').ordered

    renderer.render live_population
  end

  it "does not draw dead cells" do
    screen_driver.should_receive(:clear_screen).ordered
    screen_driver.should_not_receive(:draw_char).ordered

    renderer.render dead_population
  end
end
