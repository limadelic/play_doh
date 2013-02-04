require 'mock'

def play_doh(model=Object.new)
  Playdoh.new model
end

class Playdoh

  def initialize(model=Object.new)
    Mock.spy @model = model
  end

  def method_missing(method, *args)
    given().send method, *args
    @model.send method, *args
  end

  def given
    Mock.stub @model
  end

  def when
    @model
  end

  def then
    Mock.received @model
  end

end