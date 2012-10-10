require_relative 'spec_helper'

describe CellGenerator do
  Given(:live) { true }
  Given(:dead) { false }

  context "live cell with 0 live neighbours dies" do
    Given(:cell_with_neighbours_matrix) { Matrix[[dead,dead,dead],[dead,live,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should_not be_true }
  end

  context "live cell with 1 live neighbours dies" do
    Given(:cell_with_neighbours_matrix) { Matrix[[dead,dead,dead],[live,live,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should_not be_true }
  end

  context "live cell with 2 live neighbours lives on to the next generation" do
    Given(:cell_with_neighbours_matrix) { Matrix[[live,dead,dead],[live,live,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should be_true }
  end

  context "live cell with 3 live neighbours lives on to the next generation" do
    Given(:cell_with_neighbours_matrix) { Matrix[[live,live,dead],[live,live,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should be_true }
  end

  context "live cell with more than three live neighbours dies" do
    Given(:cell_with_neighbours_matrix) { Matrix[[live,live,live],[live,live,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should_not be_true }
  end

  context "dead cell with exactly three live neighbours becomes live" do
    Given(:cell_with_neighbours_matrix) { Matrix[[live,live,live],[dead,dead,dead],[dead,dead,dead]] }
    When(:new_cell) { CellGenerator.generate cell_with_neighbours_matrix}
    Then { new_cell.should be_true }
  end

end
