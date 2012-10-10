require_relative 'spec_helper'

describe CellGenerator do
  Given(:live) { Cell.new 'live' }
  Given(:dead) { Cell.new 'dead' }

  describe "live cell dies" do
    context "with 0 live neighbours" do
      Given(:cell_with_neighbours_matrix) { Matrix[[dead,dead,dead],[dead,live,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should_not be_alive }
    end

    context "with 1 live neighbour" do
      Given(:cell_with_neighbours_matrix) { Matrix[[dead,dead,dead],[live,live,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should_not be_alive }
    end

    context "with more than 3 live neighbours" do
      Given(:cell_with_neighbours_matrix) { Matrix[[live,live,live],[live,live,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should_not be_alive }
    end
  end

  describe "live cell lives on to the next generation" do
    context "with 2 live neighbours" do
      Given(:cell_with_neighbours_matrix) { Matrix[[live,dead,dead],[live,live,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should be_alive }
    end

    context "with 3 live neighbours" do
      Given(:cell_with_neighbours_matrix) { Matrix[[live,live,dead],[live,live,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should be_alive }
    end
  end

  context "dead cell with exactly 3 live neighbours becomes live" do
    Given(:cell_with_neighbours_matrix) { Matrix[[live,live,live],[dead,dead,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should be_alive }
  end

  describe "dead cell stays dead" do
    context "when more than 3 live neighbours" do
      Given(:cell_with_neighbours_matrix) { Matrix[[live,live,live],[live,dead,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should_not be_alive }
    end

    context "when less than 3 live neighbours" do
      Given(:cell_with_neighbours_matrix) { Matrix[[live,dead,dead],[live,dead,dead],[dead,dead,dead]] }
      When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
      Then { new_cell.should_not be_alive }
    end
  end
end
