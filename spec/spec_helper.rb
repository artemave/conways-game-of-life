require 'rspec'
require 'rspec/fire'
require 'rspec/given'
require 'awesome_print'
require 'pry'

Dir[File.expand_path "../../lib/**/*.rb", __FILE__].each &method(:require)
Dir[File.expand_path "../support/**/*.rb", __FILE__].each &method(:require)

RSpec.configure do |config|
  config.include(RSpec::Fire)
end

RSpec::Fire.configure do |config|
  config.verify_constant_names = true
end
