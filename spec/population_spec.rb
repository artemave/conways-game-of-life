require 'spec_helper'

describe Population do
  describe 'no seed' do
    it "builds matrix of dead cells of given size" do
      p = Population.new 2,3
      num_of_cells = 0
      p.each_with_index do |cell, row, col|
        num_of_cells += 1
        cell.should_not be_true
      end
      num_of_cells.should == 6
    end
  end

  describe "with live cells in seed" do
    it "place live cells into the grid accordingly to their coordinates" do
      p = Population.new 2,4, [[0,1,true],[1,3,true]]

      live_cell_coords = []
      p.each_with_index do |cell, row, col|
        live_cell_coords << [row, col] if cell
      end

      live_cell_coords.should =~ [[0,1],[1,3]]
    end
  end
end
