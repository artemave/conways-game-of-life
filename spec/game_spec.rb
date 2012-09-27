require 'spec_helper'

class Cell < Struct.new(:state)
end

describe Game do
  let(:live_cell) { Cell.new('live') }
  let(:dead_cell) { Cell.new('dead') }
  let(:seed) { [live_cell, dead_cell] }
  let(:renderer) { fire_double "Renderer" }
  let(:generation_populator) { fire_double "GenerationPopulator" }
  let(:game) { Game.new seed }

  before do
    game.renderer = renderer
    game.generation_populator = generation_populator
  end

  it "starts with initial cell configuration (seed)" do
    expect {Game.new seed}.to_not raise_error
  end

  describe "turn" do
    it "wires up generation calculator and renderer" do
      new_cells = ['new_cell1', 'new_cell2']
      generation_populator.stub(:populate).with([live_cell, dead_cell]).and_return(new_cells)
      renderer.should_receive(:render).with(new_cells)

      game.next_turn!
    end

    it "keeps current generation state" do
      new_cells1 = ['new_cell1', 'new_cell2']
      new_cells2 = ['new_cell3', 'new_cell4']
      generation_populator.stub(:populate).with([live_cell, dead_cell]).and_return(new_cells1)
      generation_populator.stub(:populate).with(new_cells1).and_return(new_cells2)

      renderer.should_receive(:render).with(new_cells1)
      renderer.should_receive(:render).with(new_cells2)

      game.next_turn!
      game.next_turn!
    end
  end

end
