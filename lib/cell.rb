class Cell < Struct.new(:state)
  def alive?
    state == 'live'
  end
end
