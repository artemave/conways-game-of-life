require_relative 'spec_helper'

describe PopulationGenerator do
  let(:population_generator) { PopulationGenerator.new max_x: 6, max_y: 5 }
  let(:seed) { Object.new }
  let(:old_generation) { Object.new }
  let(:neighbourhood1) { Object.new }
  let(:neighbourhood2) { Object.new }
  let(:cell_neighbors) { stub }
  let(:cell_generator) { stub }

  it "creates population from seed" do
    Population.stub(:new).with(5, 6, seed).and_return(population = Object.new)
    p = population_generator.generate_from_seed(seed)
    p.should == population
  end

  describe "next generation" do
    it "passes each cell with its neighbours to cell generator" do
      cell_neighbors.stub(:extract_from_population).with(old_generation).
        and_return(Matrix[[neighbourhood1, Object.new],[Object.new, neighbourhood2]])

      cell_generator.stub(:populate) do |neighbourhood|
        if [neighbourhood1, neighbourhood2].include? neighbourhood
          Cell.new 'live'
        else
          Cell.new 'dead'
        end
      end

      new_generation = population_generator.generate(old_generation)

      new_generation.should equal_population Population.new(5, 6, [0,0,Cell.new('live'), [0,1,Cell.new('live')]])
    end
  end
end
