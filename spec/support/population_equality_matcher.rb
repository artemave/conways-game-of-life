RSpec::Matchers.define :equal_population do |other_population|
  match do |population|
    actual = []
    expected = []

    population.each_with_index do |(cell, row, col)|
      actual << [row, col, cell.alive?]
    end

    other_population.each_with_index do |(cell, row, col)|
      expected << [row, col, cell.alive?]
    end

    @error = if actual != expected
               "Expected #{actual} to match #{expected}"
             end

    @error.nil?
  end

  failure_message_for_should do |population|
    @error
  end
end
