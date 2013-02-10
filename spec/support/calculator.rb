class Calculator

  def initialize
    @screen = Screen.new
  end

  def add(x, y)
    x + y
  end

  def pi
    add 3, 0.14
  end

  def turn_on
    @screen.on
  end

end

class Screen

  def on
    @on = true
  end

end