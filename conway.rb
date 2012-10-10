#!/usr/bin/env ruby

require_relative 'lib/game'
require_relative 'lib/cell'

toad_seed = [[3,1,Cell.new('live')],[3,2,Cell.new('live')],[3,3,Cell.new('live')],[2,2,Cell.new('live')],[2,3,Cell.new('live')],[2,4,Cell.new('live')]]
blinker_seed = [[2,2,Cell.new('live')],[2,3,Cell.new('live')],[2,4,Cell.new('live')]]
glider_seed = [[2,2,Cell.new('live')],[2,3,Cell.new('live')],[2,4,Cell.new('live')],[1,4,Cell.new('live')],[0,3,Cell.new('live')]]


game = Game.new glider_seed
game.init_world

while true
  game.next_turn!
end
