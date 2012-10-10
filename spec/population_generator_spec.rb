require_relative 'spec_helper'

describe PopulationGenerator do
  let(:population_generator) { PopulationGenerator.new max_x: 6, max_y: 5 }
  let(:seed) { Object.new }
  let(:old_generation) { Object.new }
  let(:neighbourhood1) { Object.new }
  let(:neighbourhood2) { Object.new }
  let(:cell_neighbourhood) { fire_replaced_class_double 'CellNeighbourhood' }
  let(:cell_generator) { fire_replaced_class_double 'CellGenerator' }

  it "creates population from seed" do
    Population.stub(:new).with(5, 6, seed).and_return(population = Object.new)
    p = population_generator.generate_from_seed(seed)
    p.should == population
  end

  describe "next generation" do
    it "passes each cell with its neighbours to cell generator and returns new population out of results" do
      cell_neighbourhood.stub(:extract_from_population).with(old_generation).
        and_return(Matrix[[neighbourhood1, Object.new],[Object.new, neighbourhood2]])

      cell_generator.stub(:generate) do |neighbourhood|
        if [neighbourhood1, neighbourhood2].include? neighbourhood
          true
        else
          false
        end
      end

      new_generation = population_generator.generate(old_generation)

      new_generation.should equal_population Population.new(2, 2, [[0,0,true], [1,1,true]])
    end
  end
end
