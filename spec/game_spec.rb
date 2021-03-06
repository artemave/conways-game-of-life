require 'spec_helper'

describe Game do
  let(:live_cell) { Cell.new('live') }
  let(:live_cell2) { Cell.new('dead') }
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

  it "draws initial population (from seed)" do
    renderer.should_receive(:render).with(first_population)
    game.init_world
  end

  describe "turn" do
    it "wires up generation calculator and renderer" do
      population_generator.stub(:generate).with(first_population).and_return(second_population)
      renderer.should_receive(:render).with(first_population).ordered
      renderer.should_receive(:render).with(second_population).ordered

      game.init_world
      game.next_turn!
    end

    it "keeps current generation state" do
      population_generator.stub(:generate).with(first_population).and_return(second_population)
      population_generator.stub(:generate).with(second_population).and_return(third_population)

      renderer.should_receive(:render).with(first_population).ordered
      renderer.should_receive(:render).with(second_population).ordered
      renderer.should_receive(:render).with(third_population).ordered

      game.init_world
      game.next_turn!
      game.next_turn!
    end
  end
end
