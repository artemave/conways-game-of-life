require_relative 'spec_helper'

describe CellNeighbourhood do
  let(:live) { Cell.new 'live' }
  let(:dead) { Cell.new 'dead' }

  it "produces matrix of cells with neighbours out of population" do

    #   0 1 2 3
    # 0 + - - -
    # 1 - + - +
    # 2 - + - -
    population = Population.new 3,4, [
      [0,0,live],
      [1,1,live],
      [1,3,live],
      [2,1,live]
    ]

    n00 = Matrix[
      [dead,dead,dead],
      [dead,live,dead],
      [dead,dead,live]
    ]
    n01 = Matrix[
      [dead,dead,dead],
      [live,dead,dead],
      [dead,live,dead]
    ]
    n02 = Matrix[
      [dead,dead,dead],
      [dead,dead,dead],
      [live,dead,live]
    ]
    n03 = Matrix[
      [dead,dead,dead],
      [dead,dead,dead],
      [dead,live,dead],
    ]
    n10 = Matrix[
      [dead,live,dead],
      [dead,dead,live],
      [dead,dead,live]
    ]
    n11 = Matrix[
      [live,dead,dead],
      [dead,live,dead],
      [dead,live,dead]
    ]
    n12 = Matrix[
      [dead,dead,dead],
      [live,dead,live],
      [live,dead,dead]
    ]
    n13 = Matrix[
      [dead,dead,dead],
      [dead,live,dead],
      [dead,dead,dead]
    ]
    n20 = Matrix[
      [dead,dead,live],
      [dead,dead,live],
      [dead,dead,dead]
    ]
    n21 = Matrix[
      [dead,live,dead],
      [dead,live,dead],
      [dead,dead,dead]
    ]
    n22 = Matrix[
      [live,dead,live],
      [live,dead,dead],
      [dead,dead,dead]
    ]
    n23 = Matrix[
      [dead,live,dead],
      [dead,dead,dead],
      [dead,dead,dead]
    ]

    neighbourhood = CellNeighbourhood.extract_from_population population
    neighbourhood.should == Matrix[[n00,n01,n02,n03],[n10,n11,n12,n13],[n20,n21,n22,n23]]
  end
end
