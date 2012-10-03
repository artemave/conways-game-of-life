require_relative 'spec_helper'

describe PopulationGenerator do
  let(:population_generator) { PopulationGenerator.new max_x: 6, max_y: 5 }
  let(:seed) { Object.new }

  it "creates population from seed" do
    Population.stub(:new).with(5, 6, seed).and_return(population = Object.new)
    p = population_generator.populate_from_seed(seed)
    p.should == population
  end

  it ""
end
