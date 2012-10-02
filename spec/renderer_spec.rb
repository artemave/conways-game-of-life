require_relative 'spec_helper'

describe Renderer do
  let(:live_population) { Population.new [0,1,Cell.new('live')], [1,3,Cell.new('live')], [2,2,Cell.new('dead')]}
  let(:dead_population) { Population.new [1,1,Cell.new('dead')], [1,2,Cell.new('dead')] }
  let(:renderer) { Renderer.new }
  let(:screen_driver) { fire_double 'ScreenDriver' }
  
  it "draws live cells" do
    renderer.render live_population

    screen_driver.should_receive(:draw_char).with(0, 1, '+')
    screen_driver.should_receive(:draw_char).with(1, 3, '+')
  end

  it "does not draw dead cells" do
    renderer.render dead_population

    screen_driver.should_not_receive(:draw_char)
  end
end
