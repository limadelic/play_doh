class Calculator

  attr_reader :screen

  def initialize(screen=Object.new)
    @screen = screen
  end

  def add(x, y)
    x + y
  end

  def pi
    add 3, 0.14
  end

  def turn_on
    screen.on
  end

end