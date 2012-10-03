require_relative 'spec_helper'

describe Renderer do
  let(:live_population) { Population.new 3, 4, [[0,1,Cell.new('live')], [1,3,Cell.new('live')]]}
  let(:dead_population) { Population.new 2, 2, [] }
  let(:renderer) { Renderer.new screen_driver }
  let(:screen_driver) { fire_double 'ScreenDriver' }
  
  it "draws live cells" do
    screen_driver.should_receive(:draw_char).with(0, 1, '+')
    screen_driver.should_receive(:draw_char).with(1, 3, '+')

    renderer.render live_population
  end

  it "does not draw dead cells" do
    screen_driver.should_not_receive(:draw_char)

    renderer.render dead_population
  end
end
