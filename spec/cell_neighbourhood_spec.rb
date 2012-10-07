require_relative 'spec_helper'

describe CellNeighbourhood do
  it "produces matrix of cells with neighbours out of population" do

    #   0 1 2 3
    # 0 + - - -
    # 1 - + - +
    # 2 - + - -
    population = Population.new 3,4, [
      [0,0,Cell.new('live')],
      [1,1,Cell.new('live')],
      [1,3,Cell.new('live')],
      [2,1,Cell.new('live')]
    ]

    n00 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('live')]
    ]
    n01 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('live'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')]
    ]
    n02 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('live'),Cell.new('dead'),Cell.new('live')]
    ]
    n03 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
    ]
    n10 = Matrix[
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('live')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('live')]
    ]
    n11 = Matrix[
      [Cell.new('live'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')]
    ]
    n12 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('live'),Cell.new('dead'),Cell.new('live')],
      [Cell.new('live'),Cell.new('dead'),Cell.new('dead')]
    ]
    n13 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')]
    ]
    n20 = Matrix[
      [Cell.new('dead'),Cell.new('dead'),Cell.new('live')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('live')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')]
    ]
    n21 = Matrix[
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')]
    ]
    n22 = Matrix[
      [Cell.new('live'),Cell.new('dead'),Cell.new('live')],
      [Cell.new('live'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')]
    ]
    n23 = Matrix[
      [Cell.new('dead'),Cell.new('live'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')],
      [Cell.new('dead'),Cell.new('dead'),Cell.new('dead')]
    ]

    neighbourhood = CellNeighbourhood.extract_from_population population
    neighbourhood.should == Matrix[[n00,n01,n02,n03],[n10,n11,n12,n13],[n20,n21,n22,n23]]
  end
end
