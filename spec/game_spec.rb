require 'spec_helper'

describe Game do
  let(:live_cell) { true }
  let(:live_cell2) { false }
  let(:seed) { [live_cell, live_cell2] }
  let(:renderer) { fire_double "Renderer" }
  let(:population_generator) { fire_double "PopulationGenerator" }
  let(:game) { Game.new seed }
  let(:first_population) { Population.new }
  let(:second_population) { Population.new }
  let(:third_population) { Population.new }

  before do
    game.renderer = renderer
    game.population_generator = population_generator
    population_generator.stub(:generate_from_seed).with(seed).and_return(first_population)
  end

  it "starts with initial cell configuration (seed)" do
    expect {Game.new seed}.to_not raise_error
  end

  describe "turn" do
    it "wires up generation calculator and renderer" do
      population_generator.stub(:generate).with(first_population).and_return(second_population)
      renderer.should_receive(:render).with(second_population)

      game.next_turn!
    end

    it "keeps current generation state" do
      population_generator.stub(:generate).with(first_population).and_return(second_population)
      population_generator.stub(:generate).with(second_population).and_return(third_population)

      renderer.should_receive(:render).with(second_population)
      renderer.should_receive(:render).with(third_population)

      game.next_turn!
      game.next_turn!
    end
  end

end
