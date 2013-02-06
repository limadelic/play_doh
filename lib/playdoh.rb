require 'mock'

def play_doh(model=Object.new)
  Playdoh.new model
end

class Playdoh

  def initialize(model=Object.new)
    @model = model
  end

  def method_missing(method, *args)
    given.send(method, *args) { self }
    @model.send method, *args
  end

  def given
    Mock.stub @model
  end

  def when
    @model
  end

  def then
    @model
  end

  def should(condition)
    p 'here really'
    @model.should condition
  end

end